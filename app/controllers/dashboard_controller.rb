class DashboardController < ApplicationController
  before_action :check_login
  
  layout 'spa_page'

  def index
  end
end
