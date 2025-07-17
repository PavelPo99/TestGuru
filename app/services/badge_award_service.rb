class BadgeAwardService
  RULE_CLASSES = {
    first_attempt: "Badges::FirstAttempt",
    all_tests_in_category: "Badges::AllTestsInCategory",
    all_tests_of_level: "Badges::AllTestsOfLevel"
  }.with_indifferent_access.freeze


  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @new_badges = []
  end

  def call
    badges = Badge.includes(:badge_users).all

    badges.each do |badge|
      rule_name, param = badge.rule.split(":")
      rule_class = self.class.rule_class_for(rule_name)

      next unless rule_class

      if rule_class.reward?(@user, @test_passage, param)
        award_badge(badge)
      end
    end

    @new_badges
  end

  def self.rule_class_for(rule_name)
    RULE_CLASSES[rule_name]&.constantize
  end


  private

  def award_badge(badge)
    BadgeUser.create!(user: @user, badge: badge)
    @new_badges << badge
  end
end
