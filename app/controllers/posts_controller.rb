class PostsController < ApplicationController
	
	layout false
	
	def create
		
		post = Post.new(post_params)

		if post.save
			if post.is_first()
				unless post.get_debate.start_debate()
					raise "Couldn't start debate"
				end
			end
				@argument = post
	  			@side = Post.find_turn(post.debate_id)	
	  			@path = debate_path(Debate.find(post.debate_id))
  		end

	end
	private
		def post_params

			params[:post][:account_id] = session[:user_id].to_i
			params.require(:post).permit(:account_id, :debate_id, content_attributes: [:content_body])

		end
end
