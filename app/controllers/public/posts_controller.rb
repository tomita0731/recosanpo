class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :check_access, only: [:show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id =current_user.id
    if @post.save
     flash[:notice] = "投稿に成功しました"
     redirect_to post_path(@post.id)
    else 
      render :new
    end
  end

  def index
     @posts = Post.where(publish_status:1).latest.page(params[:page])
  end
      


  def show
   respond_to do |format|
     format.html do
       @post = Post.find(params[:id])
       @post_comment = PostComment.new
       @post_comments = @post.post_comments.order(created_at: :desc)
     end
     format.json do
       @post = Post.find(params[:id])
     end
   end
  end

  def edit
    @post = Post.find(params[:id])
    is_matching_login_user
    
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to mypage_path
  end

  def update
    @post = Post.find(params[:id])
    is_matching_login_user
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました"
      redirect_to post_path(@post.id)
    else
     render :edit
    end
  end


private

  def post_params
    params.require(:post).permit(:step_count, :place, :genre, :body, :images, :publish_status, :address)
  end

  def is_matching_login_user
    post = Post.find(params[:id])
    unless post.user_id == current_user.id
      redirect_to posts_path
    end
  end

  def check_access
    @post = Post.find(params[:id])
    unless  @post.publish_status == "released" && @post.user_id = current_user.id 
      flash[:alert] = "この投稿は非公開です"
      redirect_to posts_path
    end
  end
  

  end