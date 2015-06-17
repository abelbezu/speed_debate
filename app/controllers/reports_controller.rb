class ReportsController < ApplicationController
	layout false
	def create
		if Report.create!({:account_id => current_user.id,  :page => params[:report][:page], :issue => params[:report][:issue]})
		
			flash[:notice] = "Report sent"
		else 
		end
	end 

end
