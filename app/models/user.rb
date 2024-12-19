class User < ApplicationRecord

  has_many :completed_tests
  has_many :tests, through: :completed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: "author_id"

  validates :email, presence: true


  def tests_by_level(level)
    tests.by_level(level)
  end
end
