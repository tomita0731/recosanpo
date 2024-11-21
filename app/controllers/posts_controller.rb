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
  end

  def show
  end

  def edit
  end


private

def post_params
  params.require(:post).permit(:step_count, :place, :genre, :body, :genre_id)
end

end