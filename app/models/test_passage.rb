class TestPassage < ApplicationRecord

  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :set_current_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end
    
    save!
  end

  def completed?
    if current_question.nil?
      self.current_question = nil
      return true
    end
  end

  def current_question_number
    question_size = test.questions.size 
    return question_size if current_question.nil?
    
    test.questions.order(:id).index(current_question) + 1
  end

  def test_successful?
    result_test.to_i >= SUCCESS_RATIO
  end

  def result_test
    (((self.correct_question).to_f/(self.test.questions.count).to_f) * 100).round(0)
  end

  def question_any?(params)
    params.key?("answer_ids")
  end


  private

  def set_current_question
    self.current_question = next_question
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where("id > ?", current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answer.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answer
    current_question.answers.correct
  end
end
