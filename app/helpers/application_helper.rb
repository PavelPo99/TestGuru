module ApplicationHelper
  
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{repo}",  "https://github.com/#{author}/#{repo}", rel: "nofollow noopener"
  end

  def flash_message
    safe_join(flash.map do |flash_type, message|
      alert_class = case flash_type.to_sym
                    when :notice, :success then 'alert-success'
                    when :alert, :error then 'alert-danger'
                    when :warning then 'alert-warning'
                    else 'alert-info'
      end

      content_tag :div, sanitize(message), class: "alert #{alert_class} my-4"
    end.compact)
  end


  def admin_required!
    redirect_to root_path, alert: "You are not authorized to view this page." unless current_user.is_a?(Admin)
  end
end
