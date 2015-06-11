require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "should authenticate user with email and password" do 
  	user = Factory.create(:account, :email => "tuser@toucan.com", :password => "123456789")
  	user.authenticate("tuser@toucan.com", "123456789").should = user
  end
end
