Rails.application.config.middleware.use Omniauth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  :client_options => {
    :site => 'https://graph.facebook.com/v2.0',
    :authorize_url => "https://www.facebook.com/v2.0/dialog/oauth"
  }
end
