class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
 
 	#unknown purpose, for now
	def store_return_to
			session[:return_to] = request.url
	end
	
	def after_sign_in_path_for(resource)
	   debates_path()
	end
	
	def after_sign_up_path_for(resource)
	   debates_path()
	end


	def confirm_admin
		unless is_admin			
			redirect_to(:controller => 'topics', :action => "index")
			return false
		else 
			return true
		end
	end

	def is_admin
		if account_signed_in?
			return  current_account.privilege == 'admin' || current_account.privilege == 'super'
		else
			return false
		end
	end

	def is_super_admin
		if account_signed_in?
			return current_account.privilege == 'super'
		else
			return false
		end
	end

	def confirm_super_admin
		unless is_super_admin
						
			return false
		else 
			return true
		end
	end 

	def notify_user account_id, sender_id, sender_type ,message, url
			#send 
			Notification.create!(:account_id => account_id, 
							 :sender_id => sender_id, 
							 :sender_type => sender_type, 
							 :message => message,
							 :url => url,
							 :checked => false)
			message = message
			path = account_path(Account.find(account_id))
			PrivatePub.publish_to("#{path}", "notification_box.notify(1000, 5000, '#{message}')")
			
	end



	def partial_copy(main_hash_input, list_of_fields)
		return_hash = Hash.new
		list_of_fields.each do |x|
			return_hash[x] = main_hash_input[x]
		end
		return_hash

	end

	def inspect par_inspect
		@param_inspect = par_inspect
		redirect_to(:controller => 'topics', :action => "real_test")
	end 

	private 
	protected

		def configure_permitted_parameters
		  devise_parameter_sanitizer.for(:sign_up) << :first_name
		  devise_parameter_sanitizer.for(:sign_up) << :last_name
		  devise_parameter_sanitizer.for(:sign_up) << :display_name
		   devise_parameter_sanitizer.for(:sign_up) << :uid
		  devise_parameter_sanitizer.for(:sign_up) << :oauth_token
		  devise_parameter_sanitizer.for(:sign_up) << :provider
		  
		  
		end



  
	
	
end
