class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user


  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  
end
