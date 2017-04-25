class PostsController < ApplicationController
  before_action :verify_post_owner, only: [:update, :destroy]

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @subs = Sub.all
    render :edit
  end

  def create
    @post = Post.new(post_params)
    @subs = Sub.all
    @post.author = current_user
    if @post.valid?
      @post.save
      redirect_to subs_url
    else
      flash.now[:errors] = @post.errors.full_messages
      # fail
      render :new
    end
  end

  def update
    @post = Post.find(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @all_comments = @post.comments.includes(:author) # => first query.
    # debugger
    # @top_level_comments = @post.comments.where(parent_comment_id: nil)
    # @comments = @post.comments
    render :show
  end

  def destroy
    @post = Post.find(id: params[:id])
    @sub = @post.sub
    @post.destroy
    redirect_to sub_url(@sub)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [])
    # question here--in a real life scenario is this a design decision?
  end

  private
  def verify_post_owner #does this have access to params? or inst vars?
    unless @post.author == current_user
      flash.now[:errors] = ["You must be the author of the post to edit or update."]
      render :edit
    end
  end
end
