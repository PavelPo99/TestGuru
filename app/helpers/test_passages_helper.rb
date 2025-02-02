module TestPassagesHelper

  def success_rate_message(test_passage)
    if test_passage.test_successful?
      content_tag(:p, content_tag(:h3, "The test was passed successfully") +
        "success rate: " + content_tag(:span, "#{test_passage.result_test}%", style: "color: green;"))
    else
      content_tag(:p, content_tag(:h3, "The test failed") + 
        "success rate: " + content_tag(:span, "#{test_passage.result_test}%", style: "color: red;"))
    end
  end
end
