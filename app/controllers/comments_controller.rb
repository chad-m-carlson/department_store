class CommentsController < ApplicationController

def index
  @item = Item.find(params[:item_id])
  @comment = @item.comments
end

  def new
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(params.require(:comment).permit(:author, :body))
    if @comment.save
      redirect_to department_item_path(@item.department_id, @item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
  end
end
