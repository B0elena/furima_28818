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
      
      ActionCable.server.broadcast 'comment_channel', content: @comment, user: @user
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
