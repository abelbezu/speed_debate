class UserActivity < ActiveRecord::Base
# Records users activities. Mainly used to check if a user is online and notify others
# Abstraction: {user (Account), status, last_signed_in, update_status} -> activity
# One activity per user
# class updates regularly.
# activity always has account_id (activity always describes account), and status
# 


belongs_to :account
validates_presence_of :account_id
validates_presence_of :status

scope :online, lambda{where(:status => "online")} # returns a post

#get when the user was last seen
#return Timestamp last_seen: user's last recorded lastseen time
def get_last_seen 
	return self.last_seen
end

#get the status of the user 
#return true if the user is online false otherwise 
def online?
	return self.status == "online"
end

#initialize or update the user's activity record
#return true if activity is successfuly created or updated
def self.create_activity account_id
	if Account.find(account_id).user_activity == nil
		activity = Account.find(account_id).build_user_activity
		activity.last_seen = DateTime.now
		activity.status = "online"
		return activity.save
	else 
		activity = Account.find(account_id).user_activity
		activity.last_seen = DateTime.now
		activity.status = "online"
		return activity.save
	end

end

#change the status of a user to online
def set_online
	self.status = "online"
end

#change the staus of a user to offline
def set_offline
	self.status = "offline"
end

#returns the users that are currently online
def self.get_online_users

	online_users = []
	UserActivity.all.online.each do |activity|
		online_users<< Account.find(activity.account_id)
	end
	return online_users

end

#sets the update status to updated
def set_status_updated
	self.update_status = "updated"
	self.status ="online"
	return self.save
end

#sets the update status to pending, and then to expired
#@return: the value the status is updated to, if the update succeeded throw exception otherwise

def update_timeout
	if self.update_status == "updated"
		self.update_status = "pending"
	elsif self.update_status == "pending"
		self.update_status = "expired"
		self.status = "offline"
	else 
		self.status = "expired"
	end
	if self.save
		return self.update_status
	end
	raise "status update failed"
			
end

#returns the update status of the user
def get_update_status
	return self.update_status
end







end
