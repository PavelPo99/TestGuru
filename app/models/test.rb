class Test < ApplicationRecord
  
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :completed_tests
  has_many :users, through: :completed_tests


  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }

  scope :easy_level, -> { where(level: 0..1) }
  scope :average_level, -> { where(level: 2..4) }
  scope :difficult_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, -> (level) { where(level: level )}
  scope :category_title, -> (category_title) { joins(:category)
                                            .where(categories: { title: category_title }) }


  def by_category_title (category_title)  
    category_title(category_title).order(title: :desc).pluck(:title)   
  end                                    
end
