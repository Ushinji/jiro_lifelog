class UsersController < ApplicationController
    def new
      @user = User.new
    end
    def create
      @user = User.new
      name =params['user']['name']
      email =params['user']['email']
      @user.name= name
      @user.email=email

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
          format.js { @status = "success"}
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.js { @status = "fail" }
        end
      end
    end 
  end