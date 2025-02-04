class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :check_access, only: [:show]
  
  
  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments.order(created_at: :desc).page(params[:page])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_user_path(@post.user_id)
  end



  private

  def post_params
    params.require(:post).permit(:step_count, :place, :genre, :body, :image, :publish_status)
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def check_access
    @post = Post.find(params[:id])
    unless  @post.publish_status == "released"
      flash[:alert] = "この投稿は非公開です"
      redirect_to  admin_users_path
    end
  end

end