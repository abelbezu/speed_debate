class CommentsController < ApplicationController
	
	def create
		@comment = Comment.new(comment_params)
		if @comment.save	
  			flash[:notice] = "Comment successfully saved"
  			
  			respond_to do |format|
  				format.json  { render :json => {
  							
  								comment: @comment,
  								content: @comment.content,
  								account: Account.find(@comment.account_id)
  							}
  						}
  			end

	  		
  		else 
  			
  			redirect_to(:controller => 'topic', :action => 'index')


  		end
		
		@response = "hey there i heared you"
	end


	private
		
		def comment_params
			params[:comment][:account_id] = current_account.id
			params.require(:comment).permit(:account_id, :main_comment_id, :post_id, content_attributes: [:content_body])
		end 
end
