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
	
	def create
		if topic_params[:left_side_topic] == ""
			topic_params[:left_side_topic] = "For"
		end 
		if topic_params[:right_side_topic] == ""
			topic_params[:right_side_topic] = "Against" 
		end
 		@topic = Topic.new(topic_params)

		@topic.debates.build
		if @topic.save
  			@topic
  			redirect_to(:action => 'show', :id => @topic.id)
  		else 
  			flash[:notice] = topic_params
  			redirect_to(:action => 'index')


  		end
	end
	
	def destroy
		@topic_to_delete = Topic.find(params[:id])
		if @topic_to_delete.destroy
			
		else
			
		end
	end 
	
	private


		def topic_params

			params[:topic][:account_id] = current_account.id
			
			params.require(:topic).permit(:account_id, :topic_sentence, :description, :left_side_topic, :right_side_topic)
		end


	
end
