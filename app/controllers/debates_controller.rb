class DebatesController < ApplicationController
    ## debate controller -- shows and controlls actions for debates:
    # create a new debate topic
    # update a debate topic ... and all other default functionalities


	layout "main"
	
	


	before_action :authenticate_account!
	
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

	def destroy
		@debate_to_delete = Debate.find(params[:id])
		if @debate_to_delete.destroy
			
		else
			
		end
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
			debate.register_participant(current_account.id, params[:side])
			
			respond_to do |format|
					@debate = debate
					@path = topic_path(debate.get_topic)
					format.js {render "topics/one_debater.js.erb", status: :ok}
			end
		else
			debate = Debate.find(params[:debate_id])
			if debate.get_debaters.count == 1
				debate.join_free_side current_account.id
				respond_to do |format|
					@debate = debate

					@path = topic_path(debate.get_topic)
					format.js {render "topics/two_debaters.js.erb", status: :ok}
					name = current_account.display_name
					topic = debate.get_topic.topic_sentence
					new_t = topic.gsub("'"){"\\'"}
					#notify the other user
					
					notify_user (debate.get_opposite_user current_account).id, @debate.id, "debate", "#{name} is your opponent in: #{new_t}", topic_url(@debate.get_topic)	
				end
			else
				if debate.register_participant(current_account.id, params[:side])
					
					respond_to do |format|
						@path = topic_path(debate.get_topic)
						@debate = debate
						format.js {render "topics/two_debaters.js.erb", status: :ok}
					end
					
				else
					redirect_to(:controller => 'topics', :action => 'index')
				end
			end
		end
	end

	
end
