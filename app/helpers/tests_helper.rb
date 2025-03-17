module TestsHelper

  def test_header(test)
    if test.new_record?
     t('tests_helper.create_new_test')
    else
     t('tests_helper.edit_test', test_title: test.title)
    end 
  end
end
