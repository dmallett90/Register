require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector('title', :content => "Welcome")
    end
    
    it "should have the right header" do
      get 'home'
      response.should have_selector('h3', :content => "Welcome")
    end
    
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'about'
      response.should have_selector('title', :content => "About")
    end
    it "should have the right header" do
      get 'about'
      response.should have_selector('h3', :content => "About")
    end
    
  end
end
