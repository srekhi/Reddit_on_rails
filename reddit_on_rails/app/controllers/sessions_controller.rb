class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user.nil? || !@user.valid?
      flash.now[:errors] = ["Invalid user"] if @user.nil?
      flash.now[:errors] = @user.errors.full_messages if @user
      render :new
    else
      @user.save
      session[:session_token] = @user.session_token
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
