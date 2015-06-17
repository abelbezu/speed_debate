class TopicsController < ApplicationController

	layout "main"
	before_action :confirm_logged_in, :only => [:show]
	def index
		@topics = Topic.all
	end

	def show		
		@topic = Topic.find(params[:id])
	end

	def edit

	end
	
	

	def update

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
  			 			
  			redirect_to(:action => 'index')
  			flash[:notice] = "--success--"
  		else 
  			flash[:notice] = topic_params
  			redirect_to(:action => 'index')


  		end
	end
	
	def destroy
		@topic_to_delete = Article.find(params[:id])
		if @article_to_delete.destroy
			flash[:notice] = "--success--"
			redirect_to(:controller=> 'admin', :action => "articles")
		else
			redirect_to(:controller=> 'admin', :action => "stats_redirects")
		end
	end 
	
	private
		def topic_params

			params[:topic][:account_id] = session[:user_id].to_i
			params.require(:topic).permit(:account_id, :topic_sentence, :description, :left_side_topic, :right_side_topic)
		end


	
end
