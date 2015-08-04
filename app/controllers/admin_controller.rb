class AdminController < ApplicationController
	layout "main"

	before_action :confirm_admin
	before_action :confirm_super_admin, :only => [:create_admin]
	@page_title = 'Admin'
	def index
		
	end

	def debates
		
	end 

	def topic_debates
		@topic = Topic.find(params[:id])

	end

	def debate_summary
		@debate = Debate.find(params[:id])

	end

	def accounts
		
	end 

	def stats
		
	end 
	def reports
		@reports = Report.all
	end 

	

		def create_admin
			@account = Account.new(account_params)
			if @account.save

				session[:logged_in] = true
				session[:user_id] = @account.id
				session[:email] = account_params[:email]
				session[:name] = account_params[:display_name]

				session[:picture] = @account.picture
				redirect_to(:action =>'index')


			else 
				render('index')
			end

		end 

		def stats_redirects
			session[:return_to] = {:controller => 'admin', :action => 'index'}
		end 

		def stats_users
			session[:return_to] = {:controller => 'admin', :action => 'index'}
		end 

		def stats_debates
			session[:return_to] = {:controller => 'admin', :action => 'index'}
		end 



		private 
		def account_params
			params.require(:account).permit(:first_name, :last_name, :nick_name, :email, :password, :privilage)
		end


	end
