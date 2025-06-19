class FeedbackMailer < ApplicationMailer
  default from: -> { ENV.fetch("SMTP_USERNAME") || "feedback@testguru.com" }

  def feedback_email(feedback)
    @feedback = feedback
    mail(
      to: ENV.fetch("EMAIL_TO_ADMIN", "admin@testguru.com"),
      subject: "New feedback from #{feedback.name}"
    )
  end
end
