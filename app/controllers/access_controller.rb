class AccessController < ApplicationController

	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
	def index
		#display text and links
	end
	def login 
		#display login form (login)

	end
	def attempt_login
		if params[:account][:email].present? && params[:account][:password].present?
			found_user = Account.where(:email =>params[:account][:email]).first
			if found_user
				authorized_user = found_user.authenticate(params[:account][:password])
			end 
		end
		if authorized_user
			#mark user as logged in
			session[:logged_in] = true
			session[:user_id] = authorized_user.id
			session[:email] = authorized_user.email
			session[:name] = authorized_user.display_name
			
			session[:picture] = authorized_user.images.profile_pic.first.url
			flash[:notice] = "You are now logged in."
			redirect_to({:controller => 'topics', :action => 'index'})
		else flash[:notice] = "Invalid username/password combination."
			redirect_to(:action => 'login')
		end
	end
	def attempt_login_after_creation
		if @new_params[:account][:email].present? && @new_params[:account][:password].present?
			found_user = Account.where(:email =>@new_params[:account][:email]).first

			if found_user
				authorized_user = found_user.authenticate(@new_params[:account][:password])
			end 
		end
		if authorized_user
			#mark user as logged in
			session[:logged_in] = true
			session[:user_id] = authorized_user.id
			session[:email] = authorized_user.email
			session[:name] = authorized_user.display_name

			session[:picture] = authorized_user.images.profile_pic.first.url
			flash[:notice] = "You are now logged in."
			redirect_to(:controller => 'topics', :action =>'index')
		else flash[:notice] = "Invalid username/password combination."
			redirect_to(:action => 'login')
		end
	end
	def logout
		session[:user_id] = nil
		session[:email] = nil
		session[:logged_in] = false
		flash[:notice] = "Logged out"
		redirect_to(:controller => 'topics', :action =>'index')
	end
	def forgot_password

	end


end
