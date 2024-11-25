class PostsController < ApplicationController
  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id =current_user.id
    @post.save
    redirect_to user_path(@post.user_id)
  end

  def index
    @posts = Post.all
  end

  def show
   @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end


private

def post_params
  params.require(:post).permit(:step_count, :place, :genre, :body, :genre_id, :image)
end

end