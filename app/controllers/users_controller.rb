class UsersController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  before_action :check_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    #@microposts = @user.microposts.order(created_at: :desc)
    @microposts = @user.microposts.order("id").page(params[:page]).per(5)
  end
  
  def create
    @user = User.new(user_param)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_param)
      redirect_to @user, notice: 'プロフィールを編集しました。'
    else
      render 'edit'
    end
  end
  
  def followings
    @user  = User.find(params[:id])
    @users = @user.following_users
  end
 
  def followers
    @user  = User.find(params[:id])
    @users = @user.follower_users
  end
  
  private
  
  def user_param
    params.require(:user).permit(:name, :email, :place, :self_introduction, :password, :password_confirmation)
  end
  
  def set_profile
    @user = User.find(params[:id])
  end
  
  def check_user
    if  @user != current_user
      redirect_to root_url
    end
  end
end
