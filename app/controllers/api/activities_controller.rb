# frozen_string_literal: true

class Api::ActivitiesController < Api::ApplicationController
  before_action :check_login

  def index
    activities = Activity.includes(:store).includes(:menu).where(user_id: current_user.id)
    render json: activities
  end

  def create
    payload = ActivityPayload::Create.new(params, current_user.id)
    if payload.valid?
      activity = Activity.create!(payload.to_h)
      render json: activity
    else
      render_422(payload.errors)
    end
  end
end
