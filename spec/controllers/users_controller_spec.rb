require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => "Register")
    end
  end
  
  describe "POST 'create'" do
    
    describe "failure" do
      before(:each) do
        @attr = {  :first_name => "", :last_name => "", \
                   :street => "", :city => "", \
                   :state => "", :zip => "", \
                   :mobile_phone => "", \
                   :email => "", :optin => "" }
      end
      
      it "Should have the right title" do
        post :create, :user => @attr
        response.should have_selector('title', :content => "Register")
      end
      
      it "Should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
      
      it "Should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
    end
    describe "success" do
      before(:each) do
        @attr = { :first_name => "Example", :last_name => "User", \
           :street => "221B Baker St.", :city => "New London", \
           :state => "CT", :zip => "06320", \
           :mobile_phone => "666-555-4433", \
           :email => "me@example.com", :optin => "true" }
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
    end

  end
end
