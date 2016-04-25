class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      # binding.pry
      @following_users = current_user.following_users #自分がフォロー
      @follower_users = current_user.follower_users #自分がフォローされている
    end
  end
end