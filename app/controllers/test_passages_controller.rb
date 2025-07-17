class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[ show result update ]

  def show; end

  def result; end

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

      TestMailer.completed_test(@test_passage).deliver_later

      if @test_passage.test_successful?
        new_badges = BadgeAwardService.new(@test_passage).call

        if new_badges.any?
          flash[:notice] = t("test_passages.badge", name_badge: new_badges.map(&:title).join(", "))
        end
      end

      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path(@test_passage)
    end
  end
end
