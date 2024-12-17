class Test < ApplicationRecord
  
  belongs_to :category
  has_many :questions
  has_many :completed_tests
  has_many :users, through: :completed_tests
  belongs_to :author, class_name: 'User'


  def self.sort_by_category(category_title)
    Test.joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)   
  end
end
