class PostsController < ApplicationController
	
	layout false
	def update
		
		j render(:partial => "topics/partials/two_users")
	end 
	def create
		
		post = Post.new(post_params)

		if post.save
			if post.is_first()
				# unless post.get_debate.start_debate()
				# 	raise "Couldn't start debate"
				# end
			end
				@argument = post

	  			@side = Debate.find(post.debate_id).get_turn
	  			@path = debate_path(Debate.find(post.debate_id))
		end

	end
	def create_with_evidence
		
		post = Post.new()
		post.account_id = current_account.id
		post.debate_id = params[:debate_id]
		content = post.build_content
		content.content_body = params[:post_argument]
		if params[:og_url]
			
				evidence = post.build_evidence
				og = OpenGraph.new(params[:og_url])
		 		evidence.og_topic =  og.title
		 		evidence.og_type = og.type
		 		evidence.og_description = og.description
		 		evidence.og_image_url = og.images.first
		 		evidence.og_url = params[:og_url]

	 		
 		end
		if post.save

			if post.is_first()
				# unless post.get_debate.start_debate()
				# 	raise "Couldn't start debate"
				# end
			end
				@argument = post

	  			@side = Debate.find(post.debate_id).get_turn
	  			@path = debate_path(Debate.find(post.debate_id))
		end

	end
	private
		# def post_params

		# 	params[:post][:account_id] = current_account.id
		# 	params.require(:post).permit(:account_id, :debate_id, content_attributes: [:content_body], :og_urls)

		# end
end
