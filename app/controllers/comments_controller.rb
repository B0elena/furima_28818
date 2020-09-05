class CommentsController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @user = current_user.nickname
      @items = Item.find(params[:item_id])
      @buyer = @items.user.nickname
      if @user == @buyer
        ActionCable.server.broadcast 'comment_channel', content: @comment, user: @user, buyer: @buyer
      else
        ActionCable.server.broadcast 'commentt_channel', content: @comment, user: @user, buyer: @buyer
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
