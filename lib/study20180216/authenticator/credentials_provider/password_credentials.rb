require 'digest/sha2'

module Study20180216
  module Authenticator
    module CredentialsProvider
      class PasswordCredentials < Base
        private

        def verify
          return unless stored_password && stored_password.hashed_password == hash_password(credentials.password.raw_password)
          @user = Storage.new.find(Study20180216::User.descriptor.name, stored_password.id)
        end

        def stored_password
          @stored_password ||= Storage.new.find(Study20180216::Password.descriptor.name, credentials.password.id)
        end

        def hash_password(raw)
          Digest::SHA256.hexdigest(raw)
        end
      end
    end
  end
end
