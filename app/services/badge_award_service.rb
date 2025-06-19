class BadgeAwardService
  RULE_CLASSES = {
    all_backend_tests: "Badges::AllBackendTests",
    first_attempt: "Badges::FirstAttempt",
    all_frontend_tests: "Badges::AllFrontendTests",
    all_tests_of_1_level: "Badges::AllTestsOf1Level"
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @new_badges = []
  end

  def call
    Badge.where.not(id: @user.badge_ids).each do |badge|
      rule_class = self.class.rule_class_for(badge.rule)
      next unless rule_class

      if rule_class.reward?(@user, @test_passage)
        award_badge(badge)
      end
    end
    @new_badges
  end

  def self.rule_class_for(rule_name)
    RULE_CLASSES[rule_name.to_sym]&.constantize
  end

  private

  def award_badge(badge)
    unless @user.badges.include?(badge)
      @user.badges << badge
      @new_badges << badge
    end
  end
end
