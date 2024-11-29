class UsersController < ApplicationController
before_action :ensure_guest_user, only: [:edit]

  def mypage
    @users = User.all
    @user = User.find(current_user.id)
    @posts = @user.posts
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
    @user = User.find(params[:id])
    @posts = @user.posts
    
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'アカウントを削除しました'
    redirect_to :root
  end
end

private

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image, user_id)
end

def ensure_guest_user
  @user = User.find(params[:id])
  if @user.email == "guest@example.com"
    redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
  end
end
