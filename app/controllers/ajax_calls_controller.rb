class AjaxCallsController < ApplicationController
	def get_a_user_list
		#make some call to debates
		@debates = []
		@topic = Topic.find(params[:id])
		@topic.debates.each do |debate|
			puts debate.side_taken
			if debate.side_taken == params[:side]

				@debates << debate
				@debates
			end
		end 

			j render(:partial => "topics/partials/user_bars", :locals => {:debates => @debates})
		
	end
	def make_tester
		user = Account.find(params[:account_id])
		unless user.is_tester
			user.make_tester
		end 
	end
end
