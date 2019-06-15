# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def check_login
    unless is_login?
      session[:redirect_path] = request.fullpath
      redirect_to login_path
    end
  end

  def is_login?
    session[:user_id].present?
  end
end
