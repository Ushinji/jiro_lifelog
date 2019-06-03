class SessionsController < ApplicationController
  layout 'no_header'

  def login
  end

  def callback
    auth_hash = request.env["omniauth.auth"]
    user = User.find_for_google(auth_hash)
    redirect_path = session[:redirect_path] || root_url

    reset_session
    session[:user_id] = user.id
    flash[:success] = 'ログインに成功しました'
    
    redirect_to redirect_path
  end
end
