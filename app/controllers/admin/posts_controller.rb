class Admin::PostsController < ApplicationController
  layout 'admin'
  
  
  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments.order(created_at: :desc)
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