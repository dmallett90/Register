class UsersController < ApplicationController

  def index
    @all_users = User.all
    @title = "Listing Users"
  end

  def show
    @user   = User.find(params[:id])
    @title  = "Welcome"
  end

  def new
    @user   = User.new
    @title = "Register"
  end
  
  def create
    # raise params[:user].inspect
    @user   = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      @title  = "Register"
      render 'new'
    end
  end
  
end
