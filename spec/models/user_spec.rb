require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { :first_name => "Example", :last_name => "User", \
       :street => "221B Baker St.", :city => "New London", \
       :state => "CT", :zip => "06320", \
       :mobile_phone => "666-555-4433", \
       :email => "me@example.com", :optin => "true" }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a First Name" do
    no_name_user = User.new(@attr.merge(:first_name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require a Last Name" do
    no_name_user = User.new(@attr.merge(:last_name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require a Street" do
    no_street_user = User.new(@attr.merge(:street => ""))
    no_street_user.should_not be_valid
  end
  
  it "should require a City" do
    no_city_user = User.new(@attr.merge(:city => ""))
    no_city_user.should_not be_valid
  end
  
  # it "should require a State" do
  #   no_state_user = User.new(@attr.merge(:state => ""))
  #   no_state_user.should_not be_valid
  # end
  
    
  it "should require a Zip" do
    no_zip_user = User.new(@attr.merge(:zip => ""))
    no_zip_user.should_not be_valid
  end
  
  it "should have a zip that is no more than 5 digits long" do
    long_zip = "123456"
    bad_zip_user = User.new(@attr.merge(:zip => long_zip))
    bad_zip_user.should_not be_valid
  end
  
  it "should have a zip that is no less than 5 digits long" do
    long_zip = "1234"
    bad_zip_user = User.new(@attr.merge(:zip => long_zip))
    bad_zip_user.should_not be_valid
  end

  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject bad email addresses" do
    addresses = %w[user@foo,com user_at_foo.org user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
end
