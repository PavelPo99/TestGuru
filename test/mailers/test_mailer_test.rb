require "test_helper"

class TestMailerTest < ActionMailer::TestCase
  def completed_test
    test_passage = TestPassage.new(user: User.first, test: Test.first)
  
    TestsMailer.completed_test(test_passage)
  end
end
