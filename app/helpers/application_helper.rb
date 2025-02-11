module ApplicationHelper
  
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{repo}",  "https://github.com/#{author}/#{repo}", rel: "nofollow noopener"
  end

  def flash_message
    flash.map do |flash_type, message|
      content_tag :p, message, class: "flash #{flash_type}"  
    end.join.html_safe
  end
end
