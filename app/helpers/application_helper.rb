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

  def admin_required!
    redirect_to root_path, alert: "You are not authorized to view this page." unless current_user.is_a?(Admin)
  end
end
