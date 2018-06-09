class RootController < ApplicationController
  def index
    @user = User.first
    session[:user_id] = @user.id
  end
end