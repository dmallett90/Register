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

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'index'
      response.should have_selector('title', :content => "Listing Users")
    end
    
    it "Should have the title in an h3" do
      get 'index'
      response.should have_selector('h3', :content => "Listing Users")
    end
    
    it "Should list users" do
      @user_count = User.count
      get 'index'
      response.should have_selector('ul', :count => @user_count)
    end
    
    # it "Should get the right first name" do
    #   @first_user = User.first.first_name
    #   get 'index'
    #   response.should have_selector('ul', :content => @first_name)
    # end
    
  end
  
  # describe "GET 'edit'" do
  #   it "should be successful" do
  #     @test_user = User.first.to_param
  #     get :edit, :id => @test_user.id
  #     response.should be_valid
  #   end
  # end
  
end
