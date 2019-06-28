# frozen_string_literal: true

class Api::ApplicationController < ApplicationController
  def check_login
    return render json: {}, status: :unauthorized unless is_login?
  end

  def render_422(errors = "Unprocessable Entity")
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
