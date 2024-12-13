class User < ApplicationRecord

  def tests_by_level(level)
    Test.joins("JOIN completed_tests ON completed_tests.test_id = tests.id")
        .where(completed_tests: { user_id: self.id })
        .where(tests: { level: level })
  end
end
