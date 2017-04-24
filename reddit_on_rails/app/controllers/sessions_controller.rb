class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(username: user_params[:username], password: user_params[:password])
    if @user.valid?
      user.save
      session[:session_token] = user.session_token
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
