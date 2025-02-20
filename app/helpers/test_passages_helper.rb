module TestPassagesHelper

  def success_rate_message(test_passage)
    if test_passage.test_successful?
      content_tag(:p, content_tag(:h3,I18n.t('test_passages_helper.success_rate_message.success_test')) +
      I18n.t('test_passages_helper.success_rate_message.rate') + content_tag(:span, "#{test_passage.result_test}%", style: "color: green;"))
    else
      content_tag(:p, content_tag(:h3, I18n.t('test_passages_helper.success_rate_message.failed_test')) + 
        I18n.t('test_passages_helper.success_rate_message.rate')  + content_tag(:span, "#{test_passage.result_test}%", style: "color: red;"))
    end
  end
end
