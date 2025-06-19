class Badge < ApplicationRecord
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  validates :title, :text, :rule, :image_url, presence: true

  def self.available_rules
    BadgeAwardService::RULE_CLASSES.keys.map(&:to_s)
  end

  def self.rules_with_descriptions
    {
      all_backend_tests: I18n.t("activerecord.badge.all_backend_tests"),
      first_attempt: I18n.t("activerecord.badge.first_attempt"),
      all_frontend_tests: I18n.t("activerecord.badge.all_frontend_tests"),
      all_tests_of_1_level: I18n.t("activerecord.badge.all_tests_of_1_level")
    }
  end
end
