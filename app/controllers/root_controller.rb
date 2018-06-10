class RootController < ApplicationController
  def index
    @activities = Activity.all
  end
end