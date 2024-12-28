class Admin::PostCommentsController < ApplicationController
  layout 'admin'
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  

end