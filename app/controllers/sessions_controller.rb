class SessionsController < ApplicationController
  def login
    reset_session
  end

  def callback
    auth_hash = request.env["omniauth.auth"]
    user = User.find_for_google(auth_hash)
    session[:user_id] = user.id
    flash[:success] = 'ログインに成功しました'
    redirect_to root_ur
  end
end
