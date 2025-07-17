class BadgesController < ApplicationController
  include BadgesHelper

  before_action :authenticate_user!

  def index
    @all_badges = Badge.all
    @my_badge_ids = current_user.badges.pluck(:id)
    @badge_counts = current_user.badge_users.group(:badge_id).count
  end
end
