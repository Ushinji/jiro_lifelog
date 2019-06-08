class DashboardController < ApplicationController
  before_action :check_login
  
  layout 'no_header'

  def index
  end
end
