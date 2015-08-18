OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'] = '720723198032979', ENV['FACEBOOK_SECRET'] = '3db291dad802d2baed6dd115e19a7d6d', :scope => "user_likes, user_photos, email" 
  #provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"] = '503697991673-0fg73s7cl6rg8ae8kl9rrak4k7s54826.apps.googleusercontent.com', ENV["GOOGLE_CLIENT_SECRET"] = 'LGxBCbU04eppTO9XxikUcGFA', :scope => "email, profile"
end