class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  def show
    
  end

  private
  def user_params
    params.permit(:username, :password)
  end

  def user_exists
    @user = User.exists?(username: params[:username])
  end

end
