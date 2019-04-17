class CommentsController < ApplicationController
  # before_action :require_user
  before_action :set_product

  def create
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
      # flash[:success] = "Comment was created successfully"
      # redirect_to user_product_path(current_user,@product)
    else
      flash[:danger] = "Comment was not created"
      redirect_to :back
    end
  end

  def edit
    @comment = @product.comments.find_by(id: params[:id])
  end

  def update
    @comment = @product.comments.find_by(id: params[:id])
    @comment.update(comment_params)
  end

  def destroy
    @comment = @product.comments.find_by(id: params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:c_description)
  end

  def set_product
    @product = Product.find_by(id: params[:product_id])
  end

end
