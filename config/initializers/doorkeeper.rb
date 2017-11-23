Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record
  use_refresh_token

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    warden.authenticate!(scope: :user)
  end

  resource_owner_from_credentials do |_routes|
    u = User.find_for_database_authentication(email: params[:username])
    u if u&.valid_password?(params[:password])
  end

  access_token_expires_in 1.month

  # default_scopes  :public
  # optional_scopes :backend_management

  grant_flows %w(password)

  skip_authorization do |_resource_owner, _client|
    true
  end
end

Doorkeeper::OAuth::TokenResponse.send :prepend, UserInfoTokenResponse
