class CommentsController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @comment = Comment.new
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
