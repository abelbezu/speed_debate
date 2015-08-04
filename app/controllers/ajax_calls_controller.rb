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

	def fetch_ogp_object
		

		og = OpenGraph.new(params[:url])
		ogp_object = og
		puts "ogp_object.images"
		j render(:partial => "debates/partials/ogp_display_box", :locals => {:ogp_object => ogp_object})


		
	end 

	def join_debate_from_rich_index
		 debate = Debate.find(params[:debate_id])
		 unless debate.has_debater current_account.id
		 topic = Topic.find(params[:topic_id])
		 topic.update_attribute("right_side_topic", params[:right_side_topic])
		 puts params[:right_side_topic]
		 topic.save
		 	if debate.join_free_side current_account.id
		 		render json: topic
		 	else
		 	end
		 end

	end

	def topic_box_request
		j render(:partial => "topics/partials/rich_topic_creator")
	end

	def placeholder_box_request
		j render(:partial => "topics/partials/topic_box_place_holder")
	end



	
end
