class GistsController < ApplicationController

  before_action :authenticate_user!
  
  def create
    test_passage = TestPassage.find(params[:test_passage_id])

    result = GistQuestionServices.new(test_passage, current_user).call

    flash_answer = if result.success?
      { notice: "#{t('.success')} | #{link_in_gist(result.html_url)}" }
    else
      { alert: t('.failure')} 
    end

    redirect_to test_passage, flash_answer
  end


  private

  def link_in_gist(gist_url)
    view_context.link_to( t('helpers.link.go_gist'), gist_url, class: "link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover", target: '_blank')
  end
end
