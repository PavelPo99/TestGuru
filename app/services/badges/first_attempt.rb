module Badges
  class FirstAttempt
    def self.reward?(user, test_passage, _param = nil)
      test_passage.passed? &&
        user.test_passages.where(test: test_passage.test).passed?.count == 1
    end
  end
end
