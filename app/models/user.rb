class User < ApplicationRecord

  def tests_by_level(level)
    Test.where(author_id: self.id).and(Test.where(level: level))
  end
end
