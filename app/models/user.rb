class User < ApplicationRecord

  has_many :completed_tests
  has_many :tests, through: :completed_tests
  has_many :tests, foreign_key: "author_id"


  def tests_by_level(level)
    tests.where('level = ?', level)    
  end
end
