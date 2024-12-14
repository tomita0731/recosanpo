class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post)
    else
      @post = Post.find(params[:post_id])
      @post_comment = PostComment.new
      @error_comment = @comment
      flash[:alert] = "投稿に失敗しました"
      render 'posts/show'
    end
end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

private

 def post_comment_params
   params.require(:post_comment).permit(:comment)
 end
 
end