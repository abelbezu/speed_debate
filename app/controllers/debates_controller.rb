class DebatesController < ApplicationController
    ## debate controller -- shows and controlls actions for debates:
    # create a new debate topic
    # update a debate topic ... and all other default functionalities


	layout "main"
	
	


	before_action :confirm_logged_in
	
	# functionality not decided yet
	def index
		# #render nothing: true
		# @online_users = Account.online
   		#@online_user_count = Account.online_count
	end
	
	# functionality not decided yet
	def new

	end

	# displays a debate (list of posts)
	def show 
		@debate = Debate.find(params[:id])
	end

	def edit

	end 

	def update
	end

	def delete
	
	end




	def create
		@debate_strand = Debate.new(:topic_id => params[:id], :time_limit => params[:time_limit], :character_limit =>params[:character_limit], :back_and_forth_limit=> params[:back_and_forth_limit])

		if @debate_strand.save
			redirect_to(:controller => 'topics', :action => 'test')
		else
			redirect_to(:controller => 'topics', :action => 'index')
		end
	end

	def create_participation
		if params[:debate_id] == "-1"
			debate = Debate.create!(:topic_id => params[:topic_id])
			debate.register_participant(session[:user_id], params[:side])
			j render(:partial => "topics/partials/one_user", :locals => {:debates => ""})
		else
			debate = Debate.find(params[:debate_id])
			if debate.get_debaters.count == 1
				debate.join_free_side session[:user_id]
				j render(:partial => "topics/partials/two_users", :locals => {:debate => debate})
			else
				if debate.register_participant(session[:user_id], params[:side])
					j render(:partial => "topics/partials/two_users", :locals => {:debate => debate})
				else
					redirect_to(:controller => 'topics', :action => 'index')
				end
			end
		end
	end

	
end
