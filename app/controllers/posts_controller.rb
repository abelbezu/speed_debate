class PostsController < ApplicationController
	
	layout "main"
	before_action :store_return_to
	before_action :confirm_logged_in
	def index
		@page_title = 'Debate'
		debate_to_display = Debate.find(params[:id])
		@debate_post = {:posts => debate_to_display.posts.newest_first, :debate_id => params[:id], :turn => Post.find_turn(params[:id]) } 
		flash[:current_debate_id] = params[:id]
		
	end
	

	def new

	end

	def create
		
		post = Post.new(post_params)

		if post.save
			
				@argument = post
	  			@side = Post.find_turn(post.debate_id)	
  			
		end
	end

	private
		def post_params

			params[:post][:account_id] = session[:user_id].to_i
			params.require(:post).permit(:account_id, :debate_id, content_attributes: [:content_body])

		end
end
