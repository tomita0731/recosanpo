class Admin::PostsController < ApplicationController
  layout 'admin'
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_user_path(@post.user_id)
  end



  private

  def post_params
    params.require(:post).permit(:step_count, :place, :genre, :body, :image)
  end

  def post_params
    params.require(:user).permit(:name)
  end

end