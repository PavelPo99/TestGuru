class UsernMailer < ApplicationMailer
  def feedback_email(feedback)
    @feedback = feedback
    mail(to: @feedback.email, subject: "New Feedback from #{@feedback.name}")
  end
end
