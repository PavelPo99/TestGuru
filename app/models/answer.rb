class Answer < ApplicationRecord

  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  validate :validate_answers, on: :create

  private

  def validate_answers
    errors.add("У одного Вопроса может быть от 1-го до 4-х ответов") if question.answers.count > 3
  end
end
