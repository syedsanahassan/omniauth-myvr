require 'multi_json'
require 'jwt'
require 'omniauth/strategies/oauth2'
require 'uri'

module OmniAuth
  module Strategies
    class Myvr < OmniAuth::Strategies::OAuth2
      if ENV['MYVR_DEV']
        BASE_SCOPE_URL = "http://local.api.myvr.com:8000/auth/"
        option :client_options, {
          :site          => 'http://local.myvr.com:8000/',
          :authorize_url => 'http://local.myvr.com:8000/connect/oauth/auth',
          :token_url     => 'http://api.local.myvr.com:8000/oauth/token/'
        }
      else
        BASE_SCOPE_URL = "https://api.myvr.com/auth/"
        option :client_options, {
          :site          => 'https://myvr.com/',
          :authorize_url => 'https://myvr.com/connect/oauth/auth',
          :token_url     => 'https://api.myvr.com/oauth/token/'
        }
      end

      BASE_SCOPES = %w[property_read]
      DEFAULT_SCOPE = 'property_read'

      option :name, 'myvr'
      option :authorize_params, {grant_type: 'authorization_code'}

      def build_access_token
        token_params = {
          :client_secret => client.secret,
          :grant_type => 'authorization_code',
          :parse => true
        }
        verifier = request.params['code']
        client.auth_code.get_token(verifier, token_params)
      end
    end
  end
end
