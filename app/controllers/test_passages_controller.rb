class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]

  def show; end

  def result; end

  def update
    @test_passage = TestPassage.find(params[:id])

    if @test_passage.time_over?
    flash[:alert] = t("test_passages.times_up")

    redirect_to result_test_passage_path(@test_passage)
    elsif @test_passage.question_any?(params)
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
      send_completion_notifications
      award_badges
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path(@test_passage)
    end
  end

  def send_completion_notifications
    TestMailer.completed_test(@test_passage).deliver_later
  end

  def award_badges
    new_badges = BadgeAwardService.new(@test_passage).call
    return unless new_badges.any?

    flash[:notice] = t("test_passages.badge", name_badge: new_badges.map(&:title).join(", "))
  end
end
