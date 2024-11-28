class UsersController < ApplicationController
  def mypage
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def show
    @users = User.all
    @user = User.find(current_user.id)
    @posts = @user.posts
  end

  def index
    @users = User.all
  end
end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end
