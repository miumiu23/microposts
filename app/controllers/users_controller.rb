class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]  
  
  def edit
  @user = User.find(params[:id])
  end
    
  def update
      @user = User.find(params[:id])
   if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
   else
       # 保存に失敗した場合は編集画面へ戻す
       render 'edit'
   end
  end
  
  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
   @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
       flash[:success] = "Welcom to the Sample App!"
       redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def following
    @user = User.find(params[:id])
    @title = "Following"
    @users = @user.following_users
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @title = "Followers"
    @users = @user.follower_users
    render 'show_follow'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :profile, :locale)
  end
  
  # Before actions

  def logged_in_user
     redirect_to login_url, notice: "Please login." unless logged_in?
  end

  def correct_user
     @user = User.find(params[:id])
     redirect_to(root_path) if current_user != @user
  end
end