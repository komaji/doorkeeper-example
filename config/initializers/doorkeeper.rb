Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    current_user || warden.authenticate!(:scope => :user)
  end

  resource_owner_from_credentials do |routes|
    User.authenticate(params) if server.client
  end

  access_token_expires_in 2.hours
  use_refresh_token
  default_scopes  :public
  grant_flows %w[authorization_code client_credentials password]
end
