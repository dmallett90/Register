# == Schema Information
# Schema version: 20101104221413
#
# Table name: users
#
#  id           :integer         not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  street       :string(255)
#  city         :string(255)
#  zip          :string(255)
#  mobile_phone :string(255)
#  home_phone   :string(255)
#  other_phone  :string(255)
#  email        :string(255)
#  optin        :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :street, :city, :state, :zip, :mobile_phone, :home_phone, :other_phone, :email, :optin
  
  # A little regex magic to check for valid emails
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # Regex for states
  # state_regex = /\A[\D][\D]$\z/i
  state_regex = /^(A[LKSZRAEP]|C[AOT]|D[EC]|F[LM]|G[ANU]|HI|I[ADLN]|K[SY]|LA|M[ADEHINOPST]|N[CDEHJMVY]|O[HKR]|P[ARW]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY])$/i
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true,
                    :length   => { :maximum => 2, :minimum => 2 },
                    :format   => { :with => state_regex }
  validates :zip, :presence => true,
                  :length => { :maximum => 5, :minimum => 5 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex }
end
