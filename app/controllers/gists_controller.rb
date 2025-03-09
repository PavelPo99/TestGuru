class GistsController < ApplicationController

  before_action :authenticate_user!
  
  def create(question:, gist_url:, user:)
    Gist.create!(
      question_id: question,
      gist_url: gist_url, 
      user_id: user
    )
  end
end
