class Feedback < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true

  belongs_to :author, class_name: "User", foreign_key: "user_id"
end
