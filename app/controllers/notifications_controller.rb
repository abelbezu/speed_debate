class NotificationsController < ApplicationController
	layout false

	def create
		Notification.create!(:account_id => params[:account_id], 
							 :sender_id => params[:sender_id], 
							 :sender_type => params[:sender_type], 
							 :message => params[:message]
							 :checked => false)
	end 

	def read
		
	end
end
