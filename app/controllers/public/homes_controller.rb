class Public::HomesController < ApplicationController
  def top
    if user_signed_in?
      @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).latest
    end
  end

  def about
  end
end

