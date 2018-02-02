require 'base64'
require 'openssl'

module Study20180216
  module Authenticator
    module CredentialsProvider
      class AccessTokenCredentials < Base
        private

        def verify
          decode
        rescue
          false
        end

        def decode
          token = credentials.access_token.token
          payload, _header = JWT.decode(token, verifying_key, true, algorithm: 'ES256')
          @user = Storage.new.find(Study20180216::User.descriptor.name, payload['sub'])
        end

        def signing_key
          OpenSSL::PKey::EC.new(Base64.strict_decode64(ENV['JWT_SIGNING_KEY']))
        end

        def verifying_key
          @verifying_key ||= OpenSSL::PKey::EC.new(signing_key).tap do |pkey|
            pkey.private_key = nil
          end
        end
      end
    end
  end
end
