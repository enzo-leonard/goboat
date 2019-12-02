class UserController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:username])
  end

  def new
    @user = User.new
  end

  def create
    raise
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @boat }
      else
        format.html { render :new }
      end
    end
  end
end
