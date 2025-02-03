class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(15)
    else
      @posts = Post.looks(params[:search],params[:word]).where(publish_status: 1).page(params[:page]).per(10)
    end
  end

end
