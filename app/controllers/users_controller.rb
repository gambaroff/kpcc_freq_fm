class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
    else
      # do something
    end
  end

  def index
    render json: User.all
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    render json: @user.following
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    render json: @user.followers
  end

  private

    def user_params
      params.permit(:user_name, :email, :password,
                                   :password_confirmation)
    end
end