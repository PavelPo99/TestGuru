class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      flash[:success] = "Welcome to the Test Guru!"
      session[:user_id] = user.id
      redirect_to_back(root_path) 
    else
      flash.now[:alert] = "Are you a Guru? Verify your Email and Password, please!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
