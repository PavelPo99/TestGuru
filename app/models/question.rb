class Question < ApplicationRecord

  belongs_to :test
  has_many :answers
  
  validates :body, presence: true
  validate :validate_answers

  private

  def validate_answers
    errors.add("У одного Вопроса может быть от 1-го до 4-х ответов") unless answers.count.between?(1,4)
  end
end
