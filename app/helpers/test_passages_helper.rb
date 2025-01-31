module TestPassagesHelper

  def success_rate_message(res)
    if res >= 85
      content_tag(:p, content_tag(:h3, "The test was passed successfully") +
        "success rate: " + content_tag(:span, "#{res}%", style: "color: green;"))
    else
      content_tag(:p, content_tag(:h3, "The test failed") + 
        "success rate: " + content_tag(:span, "#{res}%", style: "color: red;"))
    end
  end
end
