require 'omniauth/strategies/oauth2'

 module OmniAuth
  module Strategies
    class Msteams < OmniAuth::Strategies::OAuth2

       option :name, 'msteams'

       option :client_options, {
        :site => 'https://login.microsoftonline.com',
        :authorize_url => '/common/oauth2/v2.0/authorize',
        :token_url => '/common/oauth2/v2.0/token'
      }

       option :provider_ignores_state, true

       def authorize_params
        super.tap do |params|
          params[:scope] = "user.read"
        end
      end

       uid { raw_info['id'] }

       info do
        {
          :email => raw_info['mail'],
          tenant_id: org_info['value'].first['id']
        }
      end

       extra do
        {
          "raw_info" => raw_info
        }
      end

       def raw_info
        @raw_info ||= access_token.get("https://graph.microsoft.com/v1.0/me").parsed
      end

       def org_info
        @org_info ||= access_token.get('https://graph.microsoft.com/v1.0/organization?$select=id').parsed
      end
    end
  end
end 
