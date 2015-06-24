class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		user = Account.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			
			sign_in_and_redirect user

		else
			session["devise.account_attributes"] = user.attributes
			redirect_to new_account_registration_url
		end
	end
	alias_method :facebook, :all
end