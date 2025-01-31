class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_update :next_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end
    
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_test
    (((self.correct_question).to_f/(self.test.questions.count).to_f) * 100).round(0)
  end

  def current_question_index
    questions = test.questions
    questions.index(current_question)
  end

  
  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answer.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answer
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).where("id > ?", current_question.id).first 
  end
end
