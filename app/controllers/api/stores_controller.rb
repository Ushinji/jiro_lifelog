# frozen_string_literal: true

class Api::StoresController < Api::ApplicationController
  before_action :check_login

  def index
    stores = Store.all
    render json: stores
  end
end
