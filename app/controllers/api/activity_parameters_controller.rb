# frozen_string_literal: true

class Api::ActivityParametersController < Api::ApplicationController
  before_action :check_login

  def index
    render json: Activity.parameters
  end
end
