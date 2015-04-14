module ApplicationHelper
	def error_messages_for(object)
		render(:partial => 'application/error_messages', :locals => {:object => object})
	end
	
	def broadcast(channel, &block)
	    message = {:channel => channel, :data => capture(&block)}
	    uri = URI.parse("http://localhost:9292/faye")
	    Net::HTTP.post_form(uri, :message => message.to_json)
  	end
end
