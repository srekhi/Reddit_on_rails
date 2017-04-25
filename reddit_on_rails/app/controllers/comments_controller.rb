class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    # @comment.post_id = params[:post_id]
    parent_comment_id = comment_params[:parent_comment_id]
    @comment.parent_comment_id = parent_comment_id
    @comment.author = current_user
    if @comment.valid?
      @comment.save
      redirect_to subs_url
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def new
    @post_id = params[:post_id]
    render :new
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render :show
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to post_url(@comment)
  end


  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
