module Badges
  class FirstAttempt
    def self.reward?(user, test_passage)
      test_passage.passed? &&
      TestPassage.where(user: user, test: test_passage.test).count == 1
    end
  end
end
