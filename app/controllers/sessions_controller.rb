class SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = t('sessions_controller.welcome', name: resource.first_name || resource.email )
  end
end
