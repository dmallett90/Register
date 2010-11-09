class PagesController < ApplicationController
  def home
    @title = "Welcome"
    @style = "ford"
  end

  def about
    @title = "About"
    @style = "standard"
  end

end
