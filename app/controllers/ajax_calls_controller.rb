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

	# def send_invitation
	# 	debate = Debate.create!(:topic_id => params[:topic_id])
	# 	title = Topic.find(params[:topic_id]).topic_sentence
	# 	new_t = title.gsub("'"){"\\'"}
	# 	message = "#{current_account.display_name} has sent you an invitation to join him on the debate: #{new_t}"
	# 	new_m = message.gsub("'"){"\\'"}
	# 	debate.register_participant(current_account.id, params[:side])
	# 	notify_user(params[:account_id], params[:sender_id], "account" ,message, topic_url(Topic.find(params[:topic_id])))
	# 	UserMailer.invitation_email(current_account, Account.find(params[:account_id]), Topic.find(params[:topic_id])).deliver
	# 	respond_to do |format|
	# 				@debate = debate
	# 				@path = topic_path(debate.get_topic)
	# 				format.js {render "topics/one_debater.js.erb", status: :ok}
	# 			end
	# end

	def send_invitation
		Log.create!(:current_user_id => current_account.id, event_log: "send_invitation called. ", param: params.to_s)
		topic = Topic.find(params[:topic_id])
		if params[:challengee_id].length >= 1
			topic.challenge.update_attribute("challengee_id", params[:challengee_id])
			topic.challenge.update_attribute("status", "waiting")
			title = topic.topic_sentence
			new_t = title.gsub("'"){"\\'"}
			message = "#{current_account.display_name} has sent you an invitation to join him on the debate: #{new_t}"
			notify_user(params[:challengee_id], current_account.id, "account", message, topic_url(Topic.find(params[:topic_id])))
			respond_to do |format|
					@topic = topic
					@account = Account.find(params[:challengee_id])
					@path = account_path(@account)
					format.js {render "topics/send_invitation.js.erb", status: :ok}
				end
		end


	end

	def send_email_invitation
		Log.create!(:current_user_id => current_account.id, event_log: "send_email_invitation called. ", param: params.to_s)
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
		Log.create!(:current_user_id => current_account.id, event_log: "read_notifications called. ", param: params.to_s)
		current_account.get_unread_notifications.each do |unread_notification|
			unread_notification.read
		end
		render json: current_account.get_unread_notifications.first
	end


	def get_comments 
		Log.create!(:current_user_id => current_account.id, event_log: "get_comments called. ", param: params.to_s)
		argument = Post.find(params[:post_id])
		@comments = argument.comments
		j render(:partial => "comments/partials/comments_list", :locals => {argument: argument, :comments => @comments})
	end

	def fetch_ogp_object
		
		Log.create!(:current_user_id => current_account.id, event_log: "fetch_ogp_object called. ", param: params.to_s)
		og = OpenGraph.new(params[:url])

		ogp_object = og
		puts params[:display_row]
		if (params[:display_row] == "true")
			j render(:partial => "posts/partials/ogp_evidence_row", :locals => {:ogp_object => ogp_object})
		else
			j render(:partial => "debates/partials/ogp_display_box", :locals => {:ogp_object => ogp_object})
		end

		
	end 


	def join_debate_from_rich_index
		Log.create!(:current_user_id => current_account.id, event_log: "join_debate_from_rich_index called. ", param: params.to_s)
		 debate = Debate.find(params[:debate_id])
		 unless debate.has_debater current_account.id
		 topic = Topic.find(params[:topic_id])
		 topic.update_attribute("right_side_topic", params[:right_side_topic])
	     puts params[:right_side_topic]
		 topic.save
		 	if debate.join_free_side current_account.id
		 		 title = topic.topic_sentence
				 new_t = title.gsub("'"){"\\'"}
				 message = "#{current_account.display_name} has accepted your challenge in: #{new_t}"
				 notify_user(debate.get_left_debater.id, current_account.id, "account", message, topic_url(Topic.find(params[:topic_id])))
	
		 		respond_to do |format|
					@debate = debate
					@topic = topic
					format.js {render "topics/join_debate.js.erb", status: :ok}
					Log.create!(:current_user_id => current_account.id, event_log: "join_debate_from_rich_index successfuly finished. ", param: params.to_s)
				end
		 	else

		 	end
		 end

	end

	
	def topic_box_request
		Log.create!(:current_user_id => current_account.id, event_log: "topic_box_request called. ", param: params.to_s)
		j render(:partial => "topics/partials/rich_topic_creator")
	end

	def placeholder_box_request
		Log.create!(:current_user_id => current_account.id, event_log: "placeholder_box_request called. ", param: params.to_s)
		j render(:partial => "topics/partials/topic_box_place_holder")
	end
	def join_box_request
		Log.create!(:current_user_id => current_account.id, event_log: "join_box_request called. ", param: params.to_s)
		debate = Debate.find(params[:debate_id])
		user = Account.find(params[:user_id])
		topic = Topic.find(params[:topic_id])
		j render(:partial => "topics/partials/join_box", locals: {debate: debate, topic: topic, user: user})
	end

	def challenge_refused
		Log.create!(:current_user_id => current_account.id, event_log: "challengee_refused called. ", param: params.to_s)
		topic = Topic.find(params[:topic_id])
		topic.challenge.update_attribute("status", "refused")
		if topic.save
			render json: topic.challenge
		end
	end

	def discard_conversation
		Log.create!(:current_user_id => current_account.id, event_log: "discard_conversation called. ", param: params.to_s)
		topic = Topic.find(params[:topic_id])
		topic.challenge.update_attribute("status", "discarded")
		if topic.save
			render json: topic.challenge
		end

	end

	def make_conversation_open
		Log.create!(:current_user_id => current_account.id, event_log: "make_conversation_open called. ", param: params.to_s)
		topic = Topic.find(params[:topic_id])
		topic.challenge.update_attribute("status", "open")
		if topic.save
			render json: topic.challenge
		end

	end

	def hide_topic
		Log.create!(:current_user_id => current_account.id, event_log: "join_debate_from_rich_index called. ", param: params.to_s)
		topic = Topic.find(params[:topic_id])
		topic.update_attribute("visibility", "hidden")
		if topic.save
			render json: topic
		end
	end

	def show_topic
		topic = Topic.find(params[:topic_id])
		topic.update_attribute("visibility", "visible")
		if topic.save
			render json: topic
		end
	end

	def count_characters
		#Log.create!(:current_user_id => current_account.id, event_log: "join_debate_from_rich_index called. ", param: params.to_s)
		render json: {count: Sanitize.fragment(params[:content_body]).length}.to_json

	end



	
end
