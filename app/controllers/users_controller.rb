class UsersController < ApplicationController
  def mypage
  end

  def edit
  end

  def show
    @user = User.find(current_user.id)
    @posts = @user.posts
  end

  def index
  end
end
