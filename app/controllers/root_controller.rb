class RootController < ApplicationController
  before_action :check_login
  
  def index
    @activities = current_user.activities.all
  end
end