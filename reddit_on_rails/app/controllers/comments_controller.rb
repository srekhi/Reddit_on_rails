class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    # @comment.post_id = params[:post_id]
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
    # fail
    @post_id = params[:post_id]
    render :new
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render :show
  end


  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
