class Notification < ActiveRecord::Base
	belongs_to :account

	scope :unread, lambda{where(:checked => false)} #returns a comment
	scope :newest_first, lambda{order("notifications.created_at DESC")}
	
	def read
		self.update_attribute(:checked, true)
	end 

	
	def get_notifications account
		return account.notifications
	end
	
end
