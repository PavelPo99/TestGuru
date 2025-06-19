class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
    @rules = Badge.rules_with_descriptions
  end

  def edit
    @rules = Badge.rules_with_descriptions
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t("admin.badge.create.success")
    else
      @rules = Badge.rules_with_descriptions
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t("admin.badge.update.success")
    else
      @rules = Badge.rules_with_descriptions
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t("admin.badge.delete.success")
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :text, :rule, :image_url)
  end
end
