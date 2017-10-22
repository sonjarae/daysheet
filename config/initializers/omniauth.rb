OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '816253168553331', '7064bbcb0fdae30875872722e81cfd15'
end