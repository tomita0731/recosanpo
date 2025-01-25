class Admin::UsersController < ApplicationController
  layout 'admin'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(publish_status: 1).order(created_at: :desc)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました。'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction,:profile_image, :created_at)
  end
end
