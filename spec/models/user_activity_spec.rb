require 'rails_helper'
#Test user activity
#Partitions: test validations
# 			-test: get_last_seen, online?, create_activity, set_online, set_offline
RSpec.describe UserActivity, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "creates basic activity" do
  	d  = DateTime.now
  	activity = build(:user_activity, :last_seen => d, :status => "offline")

  	expect(activity.last_seen).to eq(d)
  	expect(activity.status).to eq("offline")

  end

  it "validates the presence of account_id" do 
  	#try creating withoug account_id
  	build(:user_activity, :account_id => "", :status => "offline").should_not be_valid
  	#try creating with account_id
  	build(:user_activity, :account_id => '1', :status => "online").should be_valid
  end

  it "validates the presence of status" do 
  		#try creating withoug status
  	build(:user_activity, :status => "").should_not be_valid
  	#try creating with status
  	build(:user_activity, :status =>"offline").should be_valid
  end 


  it  "gets last_seen" do 
  	d  = DateTime.now

  	activity = build(:user_activity, :last_seen => d)

  	expect(activity.get_last_seen).to eq(d)


  end

  it "properly creates activity for a user" do
  	#user has no activity
  	user = create(:account)
  	expect(UserActivity.create_activity(user.id)).to eq(true)

  	#user already has activity
  	expect(UserActivity.create_activity(user.id)).to eq(true)


  end
  
  it "sets user online and offline" do
  	activity = create(:user_activity)
  	activity.set_online
  	expect(activity.online?).to eq(true)
  	activity.set_offline
  	expect(activity.online?).to eq(false)


  end

  it "gets the users that are currently online" do
  	user_1 = create(:account)
  	user_2 = create(:account)
  	user_3 = create(:account)
   	
   	activity_1 = create(:user_activity, :account_id => user_1.id)
   	activity_2 = create(:user_activity, :account_id => user_2.id)
   	activity_3 = create(:user_activity, :account_id => user_3.id) 

   	expect(UserActivity.get_online_users).to eq([user_1, user_2, user_3])
  end

  it "gets the update_status of the activity" do

  	activity = create(:user_activity)
  	expect(activity.get_update_status).to eq("expired")

  end

  it "sets the update status of the activity to the proper next status" do
  	#begin with expired
  	activity = create(:user_activity)
  	expect(activity.get_update_status).to eq("expired")
  	#change to updated
  	activity.set_status_updated
  	expect(activity.get_update_status).to eq("updated")
  	#change to pending from updated 
  	activity.update_timeout
  	expect(activity.get_update_status).to eq("pending")
  	#change to expired from pending
	activity.update_timeout
  	expect(activity.get_update_status).to eq("expired")
  	#keep at expired from expired
	activity.update_timeout
  	expect(activity.get_update_status).to eq("expired")
  	expect(activity.online?).to eq(false)  	  	


  end


end
