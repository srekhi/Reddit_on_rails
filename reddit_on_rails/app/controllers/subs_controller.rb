class SubsController < ApplicationController

  before_action :check_if_moderator, only: [:update]

  def new
    @sub = Sub.new
    render :new
  end

  def edit
    @sub = Sub.new
    render :edit
  end

  def update
    @sub = Sub.find(id: params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.valid?
      @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  private
  def check_if_moderator
    unless @sub.moderator == current_user
      flash.now[:errors] = ["You must be the moderator to edit or update a subforum"]
      render :edit
    end
  end
end
