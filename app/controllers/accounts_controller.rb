class AccountsController < ApplicationController
	layout "main"
	def index
	end

	def show
		@account = Account.find(params[:id])
	end
end
