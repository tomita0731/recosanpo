class Public::UsersController < ApplicationController
before_action :ensure_guest_user, only: [:edit]

  def mypage
    @users = User.all
    @user = User.find(current_user.id)
    @posts = @user.posts.latest.page(params[:page])
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_path(@user.id)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(publish_status:1).latest.page(params[:page])
  end

  def index
    @users = User.page(params[:page]).per(15)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'アカウントを削除しました'
    redirect_to new_user_registration_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.where(id: favorites, publish_status: 1).page(params[:page])
  end

end

private

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

def post_params
  params.require(:post).permit(:step_count, :place, :genre, :body, :images, :publish_status)
end

def ensure_guest_user
  @user = User.find(params[:id])
  if @user.email == "guest@example.com"
    redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
  end

def is_matching_login_user
  user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to mypage_path
  end
end

end