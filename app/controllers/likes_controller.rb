class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(user_id: @current_user.id, item_id: @item_id)
    @like.save
    redirect_to item_path
  end

  def destroy
  end
end
