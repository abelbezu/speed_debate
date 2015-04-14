class TopicsController < ApplicationController

	layout "main"
	before_action :confirm_logged_in, :only => [:debate_temp]
	def index
		
	end
	

	def update

	end 

	def new

	end
	
	def create
		@topic = Topic.new(partial_copy(topic_params, [:account_id, :topic_sentence, :description, :left_side_topic, :right_side_topic,:category, :tags,]))
		@topic.debates.build(partial_copy(topic_params[:debate], [:time_limit, :character_limit, :back_and_forth_limit]))
		if @topic.save
  			 			
  			redirect_to(:action => 'index')
  			flash[:notice] = "Debate successfully saved"
  		else 
  			flash[:notice] = "Couldn't create debate, Please try again"
  			redirect_to(:action => 'index')


  		end
	end

	def test
		
		@debates_for_display = Topic.newest_first 
	end
	
	def debate_temp
					
	end

	def another_test

	end
	
	def destroy
		@topic_to_delete = Article.find(params[:id])
		if @article_to_delete.destroy
			flash[:notice] = "article destroyed successfully"
			redirect_to(:controller=> 'admin', :action => "articles")
		else
			redirect_to(:controller=> 'admin', :action => "stats_redirects")
		end
	end 
	def real_test
		@test_param = 3
		
		
	end
	def fake_test
		@test_param = 9
		render partial: test, locals: {test_param: @test_param}
	end

	private
		def topic_params

			params[:topic][:account_id] = session[:user_id].to_i
			params.require(:topic).permit(:account_id, :topic_sentence, :description, :left_side_topic, :right_side_topic,:category, :tags, :debate => [:time_limit, :character_limit, :back_and_forth_limit])
		end


	
end
