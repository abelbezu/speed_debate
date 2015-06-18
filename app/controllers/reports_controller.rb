class ReportsController < ApplicationController
	layout false
	def create
		if Report.create!({:account_id => current_user.id,  :page => params[:report][:page], :issue => params[:report][:issue]})
		
			notify_user current_user.id, "Your report is recorded. Thanks for your feedback "
		else 
		end
	end 

end
