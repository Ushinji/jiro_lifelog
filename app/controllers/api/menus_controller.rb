# frozen_string_literal: true

class Api::MenusController < Api::ApplicationController
  before_action :check_login

  def index
    menus = Menu.all
    render json: menus
  end
end
