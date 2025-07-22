module Badges
  class AllTestsInCategory
    def self.reward?(user, test_passage, category_id)
      return false unless test_passage.test.category_id == category_id.to_i

      category = Category.find_by(id: category_id)
      return false unless category

      category_tests = Test.where(category: category).pluck(:id)
      return false if category_tests.empty?

      latest_passed = user.test_passages
                          .where(test_id: category_tests)
                          .select(&:passed?)
                          .map(&:test_id)

      category_tests.map { |num| latest_passed.count(num) }.uniq.size == 1
    end
  end
end
