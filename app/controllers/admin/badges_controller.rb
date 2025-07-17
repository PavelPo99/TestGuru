class Admin::BadgesController < ApplicationController
  include BadgesHelper
    before_action :set_badge, only: [ :show, :edit, :update, :destroy ]

    def index
      @badges = Badge.all
    end

    def new
      @badge = Badge.new
    end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to admin_badges_path, notice: t("admin.badge.create.success")
      else
        render :new
      end
    end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badges_path, notice: t("admin.badge.update.success")
      else
        render :edit
      end
    end

    def edit
      @rules = Badge.available_badge_rules
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
