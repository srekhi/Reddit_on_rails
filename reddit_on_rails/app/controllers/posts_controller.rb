class PostsController < ApplicationController
  before_action :verify_post_owner, only: [:update, :destroy]

  def new
    render :new
  end

  def edit
    render :edit
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to subs_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    p "in update"
    @post = Post.find(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(id: params[:id])
    @sub = @post.sub
    @post.destroy
    redirect_to sub_url(@sub)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, :sub_id)
  end

  private
  def verify_post_owner #does this have access to params? or inst vars?
    unless @post.author == current_user
      flash.now[:errors] = ["You must be the author of the post to edit or update."]
      render :edit
    end
  end
end
