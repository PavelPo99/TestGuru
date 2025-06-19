module Badges
  class AllBackendTests
    def self.reward?(user, test_passage = nil)
      category = Category.find_by(title: "Backend")
      return false unless category

      tests_in_category = Test.where(category: category)
      return false if tests_in_category.empty?

      user.test_passages.joins(:test)
          .where(tests: { category: category })
          .select(&:passed?)
          .map(&:test)
          .uniq
          .count == tests_in_category.count
    end
  end
end
