class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
	def confirm_logged_in
		unless session[:user_id]
			flash[:notice] = "Please log in."
			redirect_to(:controller => 'access', :action => "login")
			return false
		else 
			return true
		end
	end 
	
	


	def store_return_to
  		session[:return_to] = request.url
	end

	def confirm_admin
		unless is_admin
			flash[:notice] = "Please log in."
			redirect_to(:controller => 'admin', :action => "login")
			return false
		else 
			return true
		end
	end

	def is_admin
		if session[:logged_in]
			return  Account.find(session[:user_id]).privilege == 'admin' || Account.find(session[:user_id]).privilege == 'super'
		else
			return false
		end
	end

	def is_super_admin
		if session[:logged_in]
			return Account.find(session[:user_id]).privilege == 'super'
		else
			return false
		end
	end
	
	def confirm_super_admin
		unless :is_super_admin
			flash[:notice] = "Please log in."
			
			return false
		else 
			return true
		end
	end 

	def notify_user account_id, message
		
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

	USER_CHANNEL_KEY = 'user_channel_key'

    def after_sign_in_path_for(resource)
      if resource.is_a? User
        set_user_channel_cookie
      end
      super
    end

    def after_sign_out_path_for(resource)
      if resource.is_a? User
        clear_user_channel_cookie
      end
      super
    end

	
	private

		def current_user
		  @current_user ||= Account.find(session[:user_id]) if session[:user_id]
		end
		helper_method :current_user

   
	    def set_user_channel_cookie
	      key = current_user.channel_key
	      WebsocketRails[key].make_private
	      cookies[USER_CHANNEL_KEY] = {:value => key,
	                                     :expires => 30.days.from_now }
	    end

	    def clear_user_channel_cookie
	      cookies.delete USER_CHANNEL_KEY
	    end

end
