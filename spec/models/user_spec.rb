require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = {
        :first_name => "Example",
        :last_name => "User",
        :street => "221B Baker St.",
        :city => "New London",
        :state => "CT",
        :zip => "06320",
        :mobile_phone => "666-555-4433",
        :email => "me@example.com",
        :optin => true
        }
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
  
  it "should require a State" do
    no_state_user = User.new(@attr.merge(:state => ""))
    no_state_user.should_not be_valid
  end
  
  it "State should be no longer than 2 letters" do
    no_state_user = User.new(@attr.merge(:state => "ABC"))
    no_state_user.should_not be_valid
  end
    
  it "State should be no shorter than 2 letters" do
    no_state_user = User.new(@attr.merge(:state => "A"))
    no_state_user.should_not be_valid
  end
  
  it "Should not accept a state with numbers" do
    bad_state_user = User.new(@attr.merge(:state => "A3"))
    bad_state_user.should_not be_valid
  end

  it "Should not accept a bogus state" do
    bad_state_user = User.new(@attr.merge(:state => "QQ"))
    bad_state_user.should_not be_valid
  end
  
  it "Should accept valid states" do
    valid_states = %w[AK AL MI MA CA TN TX VA WV]
    valid_states.each do |state_check|
      good_state_user = User.new(@attr.merge(:state => state_check))
      good_state_user.should be_valid
    end
  end

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

  it "should accept good email addresses" do
    addresses = %w[user@foo.com user.foo@email.kr.afb.mil mail+spam@example.com]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should be_valid
    end
  end

  it "should rejectd blank terms and coniditions" do
    no_optin_user = User.new(@attr.merge(:optin => ""))
    no_optin_user.should_not be_valid
  end
  
  it "should accept checked terms and conditions" do
    optin_user = User.new(@attr.merge(:optin => true))
    optin_user.should be_valid
  end

end
