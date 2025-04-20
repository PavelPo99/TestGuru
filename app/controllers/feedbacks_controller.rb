class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      UserMailer.feedback_email(@feedback).deliver_now
      redirect_to root_path, notice: "Thank you for your feedback!"
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
