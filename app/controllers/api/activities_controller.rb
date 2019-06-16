# frozen_string_literal: true

class Api::ActivitiesController < Api::ApplicationController
  before_action :check_login

  def index
    activities = Activity.includes(:store).includes(:menu).where(user_id: current_user.id)
    render json: activities
  end
end
