class SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Привет, #{resource.first_name}!"
  end
end
