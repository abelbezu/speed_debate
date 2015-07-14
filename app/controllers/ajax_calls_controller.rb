class AjaxCallsController < ApplicationController
	def get_a_user_list
		#make some call to debates
		@debates = []
		@topic = Topic.find(params[:id])
		@topic.debates.each do |debate|
			puts debate.side_taken
			if debate.side_taken == params[:side]

				@debates << debate
				@debates
			end
		end 

	    j render(:partial => "topics/partials/user_bars", :locals => {:debates => @debates})
		
	end
	def make_tester
		user = Account.find(params[:account_id])
		unless user.is_tester
			user.make_tester
		end 
	end

	def send_invitation
		debate = Debate.create!(:topic_id => params[:topic_id])
		title = Topic.find(params[:topic_id]).topic_sentence
		new_t = title.gsub("'"){"\\'"}
		message = "#{current_account.display_name} has sent you an invitation to join him on the debate: #{new_t}"
		new_m = message.gsub("'"){"\\'"}
		debate.register_participant(current_account.id, params[:side])
		notify_user(params[:account_id], params[:sender_id], "account" ,message, topic_url(Topic.find(params[:topic_id])))
		UserMailer.invitation_email(current_account, Account.find(params[:account_id]), Topic.find(params[:topic_id])).deliver
		respond_to do |format|
					@debate = debate
					@path = topic_path(debate.get_topic)
					format.js {render "topics/one_debater.js.erb", status: :ok}
				end
	end

	def send_email_invitation
		debate = Debate.create!(:topic_id => params[:topic_id])
		debate.register_participant(current_account.id, params[:side])
		UserMailer.invitation_by_email(current_account, params[:reciever_email], Topic.find(params[:topic_id])).deliver
		respond_to do |format|
					@debate = debate
					@path = topic_path(debate.get_topic)
					format.js {render "topics/one_debater.js.erb", status: :ok}
				end
	end

	def read_notifications
		current_account.get_unread_notifications.each do |unread_notification|
			unread_notification.read
		end
		render json: current_account.get_unread_notifications.first
	end


	def get_comments 
		@comments = Post.find(params[:post_id]).comments
		j render(:partial => "comments/partials/comments_list", :locals => {:comments => @comments})
	end

	
end
