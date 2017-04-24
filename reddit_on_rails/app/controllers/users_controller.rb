class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:session_token] = @user.session_token
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
