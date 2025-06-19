module Badges
  class AllTestsOf1Level
    def self.reward?(user, test_passage = nil)
      target_level =  1

      tests_of_level = Test.where(level: target_level)
      return false if tests_of_level.empty?

      user_passed_tests = user.test_passages
                            .joins(:test)
                            .where(tests: { level: target_level })
                            .select(&:passed?)
                            .map(&:test)
                            .uniq

      user_passed_tests.size == tests_of_level.count
    end
  end
end
