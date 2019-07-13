# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new
    store_id = params["activity"]["store_id"]
    menu_id = params["activity"]["menu_id"]
    size = params["activity"]["size"]
    yasai = params["activity"]["yasai"]
    ninniku = params["activity"]["ninniku"]
    abura = params["activity"]["abura"]
    karame = params["activity"]["karame"]
    calorie = params["activity"]["calorie"]

    @activity.user_id = current_user.id
    @activity.store_id = store_id
    @activity.menu_id = menu_id
    @activity.size = size
    @activity.yasai = yasai
    @activity.ninniku = ninniku
    @activity.abura = abura
    @activity.karame = karame
    @activity.calorie = calorie

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: "activity was successfully created." }
        format.json { render "", status: :created, location: @activity }
        format.js { @status = "success" }
      else
        format.html { render "" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end
end
