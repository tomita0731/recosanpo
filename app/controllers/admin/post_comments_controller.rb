class Admin::PostCommentsController < ApplicationController
  layout 'admin'
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_post_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  

end