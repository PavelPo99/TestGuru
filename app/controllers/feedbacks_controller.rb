class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.email = current_user.email
    @feedback.author = current_user

    if @feedback.valid?
      FeedbackMailer.feedback_email(@feedback).deliver_later
      redirect_to root_path, notice: t(".success")
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :message)
  end
end
