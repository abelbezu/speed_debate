class DebatesController < ApplicationController
    ## debate controller -- shows and controlls actions for debates:
    # create a new debate topic
    # update a debate topic ... and all other default functionalities


	layout "main"
	
	before_action :confirm_logged_in
	
	# functionality not decided yet
	def index
		render nothing: true
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
		@debate_participation = DebateParticipation.new(:account_id => session[:user_id], :debate_id => params[:id], :role => 'debater', :side =>params[:side])
		if @debate_participation.save
			redirect_to(:controller => 'topics', :action => 'test')
		else
			redirect_to(:controller => 'topics', :action => 'index')
		end
	end

	
end
