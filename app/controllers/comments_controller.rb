class CommentsController < ApplicationController
	layout false
	def create
		comment = Comment.new(comment_params)
		if comment.save	
  			flash[:notice] = "Comment successfully saved"  			
  			@comment = comment	
  			@argument = comment.get_post  		
  		else   			
  			redirect_to(:controller => 'topic', :action => 'index')
  		end
		
		
	end


	private
		
		def comment_params
			params[:comment][:account_id] = current_account.id
			params.require(:comment).permit(:account_id, :main_comment_id, :post_id, content_attributes: [:content_body])
		end 
end
