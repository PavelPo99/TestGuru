module Badges
  class AllTestsOf1Level
    def self.reward?(user, test_passage, target_level)
      return false unless test_passage.test.level == target_level.to_i

      tests_of_level = Test.where(level: target_level).pluck(:id)
      return false if tests_of_level.empty?

      user_passed_tests = user.test_passages
                            .joins(:test)
                            .where(tests: { level: target_level })
                            .select(&:passed?)
                            .map(&:test)
                            .pluck(:id)

      tests_of_level.map { |num| user_passed_tests.count(num) }.uniq.size == 1
    end
  end
end
