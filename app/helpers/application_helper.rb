module ApplicationHelper
  
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{repo}",  "https://github.com/#{author}/#{repo}", rel: "nofollow noopener"
  end

  def flash_message(message)
    case message
    when :alert
      content_tag :p, flash[:alert], class: "flash alert"  
    end
  end
end
