class UsersController < ApplicationController

  def index
    @style = "standard"
    @all_users = User.all
    @title = "Listing Users"
  end

  def show
    @style = "standard"
    @user   = User.find(params[:id])
    @title  = "Welcome"
  end

  def new
    @style = "standard"
    @user   = User.new
    @title = "Register"
  end
  
  # def edit
  #   @style = "standard"
  #   @user  = User.find(params[:id])
  #   @title = "Edit Information"
  # end
  
  def create
    @style = "standard"
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
