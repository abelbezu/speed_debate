OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'] = '610219292455523', ENV['FACEBOOK_SECRET'] = 'd07dd49d96698eddd39131524002c120', {:client_options => {:ssl => {:ca_file => "C:\\curl-ca-bundle.crt"}}}
end