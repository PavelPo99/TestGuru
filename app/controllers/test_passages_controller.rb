class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[ show result update gist ]

  def show; end

  def result; end

  def gist
    result = GistQuestionServices.new(@test_passage.current_question).call

    flash_options = if Octokit.gist(result.id).present?
      link = view_context.link_to( t('helpers.link.go_gist'), result.html_url, class: "link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover", target: '_blank')

      create_table_gist(result)

      { notice: "#{t('.success')} | #{link}" }
    else
      { alert: t('.failure')}  
    end

    redirect_to @test_passage, flash_options
  end

  def update
    if @test_passage.question_any?(params) 
      @test_passage.accept!(params[:answer_ids])

      completed_test
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def completed_test
    if @test_passage.completed?
      
      TestMailer.completed_test(@test_passage).deliver_now

      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path(@test_passage)
    end
  end

  def create_table_gist(result)
    Gist.create!(
      question_id: @test_passage.current_question.id,
      gist_url: result.html_url, 
      user_id: current_user.id
    )
  end
end
