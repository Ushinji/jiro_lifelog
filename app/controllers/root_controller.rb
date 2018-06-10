class RootController < ApplicationController
  before_action :check_login
  
  def index
    @activities = Activity.all
  end
end