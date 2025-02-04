class Public::HomesController < ApplicationController
  def top
    if user_signed_in?
      @posts = Post.where(publish_status:1).where(user_id: [current_user.id, *current_user.following_ids]).latest.page(params[:page])
    end
  end

  def about
  end
end

