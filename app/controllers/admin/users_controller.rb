class Admin::UsersController < ApplicationController
  layout 'admin'

  def index
    @users = User.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(publish_status: 1).order(created_at: :desc).page(params[:page])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction,:profile_image, :created_at)
  end
end
