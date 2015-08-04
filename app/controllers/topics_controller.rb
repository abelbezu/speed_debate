class TopicsController < ApplicationController

	layout "main"
	before_action :authenticate_account!, :only => [:show]
	def index
		@topics = Topic.sort_for_home_page

	end

	def show		
		@topic = Topic.find(params[:id])
		
	end

	def edit

	end
	
	

	def update
		puts params.inspect
		@new_topic = Topic.find(params[:id])
		if @new_topic.update(topic_params)
	    	redirect_to(@new_topic)
	    else 
	    	redirect_to(:controller => "topics", :action => "index")
	    end 
	end 

	def new

	end
	
	# def create
	# 	if topic_params[:left_side_topic] == ""
	# 		topic_params[:left_side_topic] = "For"
	# 	end 
	# 	if topic_params[:right_side_topic] == ""
	# 		topic_params[:right_side_topic] = "Against" 
	# 	end
	# 		@topic = Topic.new(topic_params)

	# 	@topic.debates.build
	# 	if @topic.save
    #  			@topic
    #  			redirect_to(:action => 'show', :id => @topic.id)
    #  		else 
    #  			flash[:notice] = topic_params
    #  			redirect_to(:action => 'index')


    #   		end
	# end

	def og_create
		puts params
 		@topic = Topic.new(account_id: current_account.id, topic_sentence: params[:topic_sentence], description: params[:description], left_side_topic: params[:left_side_topic], right_side_topic: "")
 		

 		story = @topic.build_story
 		og = OpenGraph.new(params[:og_url])

 		story.og_topic =  og.title
 		story.og_type = og.type
 		story.og_description = og.description
 		story.og_image_url = og.images.first
 		story.og_url = params[:og_url]


		debate = @topic.debates.build
		if @topic.save
  			if story.save!
  			 	debate.register_participant current_account.id, "left"

  			 	if params[:opponent_email] != ""
  			 		Challenge.create!(:topic_id => @topic.id, :challenger_id => current_account.id, challengee_email: params[:opponent_email])
 					UserMailer.invitation_by_email(current_account, params[:opponent_email], Topic.find(@topic.id)).deliver
		 		elsif params[:selected_opponent_id] != "-1"
		 			Challenge.create!(:topic_id => @topic.id, :challenger_id => current_account.id, challengee_id: params[:selected_opponent_id])
 					UserMailer.invitation_by_email(current_account, Account.find(params[:selected_opponent_id]).email, Topic.find(@topic.id)).deliver
		 		else

		 		end
		 		respond_to do |format|
		 			@debate = debate
					format.js {render "topics/og_create.js.erb", status: :ok}
				end
		 		
  				#j render(:partial => "topics/partials/rich_topic_index", :locals => {topic: @topic, debate: debate})
  			end  			
  		else 
  			#flash[:notice] = topic_params
  			redirect_to(:action => 'index')
  		end
	end

	
	def destroy
		@topic_to_delete = Topic.find(params[:id])
		if @topic_to_delete.destroy
			render json: @topic_to_delete
		else
			flash[:alert] = "couldn't delete topic"
			render json: {error: "couldn't perform action"}
		end
	end 
	
	private

		# def topic_params

		# 	params[:topic][:account_id] = current_account.id
			
		# 	params.require(:topic).permit(:account_id, :topic_sentence, :description, :left_side_topic, :right_side_topic)
		# end	
end
