OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'] = '610219292455523', ENV['FACEBOOK_SECRET'] = 'd07dd49d96698eddd39131524002c120', :scope => "user_likes, user_photos, email" 
  #provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"] = '503697991673-0fg73s7cl6rg8ae8kl9rrak4k7s54826.apps.googleusercontent.com', ENV["GOOGLE_CLIENT_SECRET"] = 'LGxBCbU04eppTO9XxikUcGFA', :scope => "email, profile"
end