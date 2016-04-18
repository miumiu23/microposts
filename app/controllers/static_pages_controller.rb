class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @follwings = nil #自分がフォロー
      @followers = nil #自分がフォローされている
    end
  end
end