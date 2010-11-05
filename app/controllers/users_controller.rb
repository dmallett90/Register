class UsersController < ApplicationController

  def show
    @user   = User.find(params[:id])
    @title  = "Welcome"
  end

  def new
    @title = "Register"
  end

end
