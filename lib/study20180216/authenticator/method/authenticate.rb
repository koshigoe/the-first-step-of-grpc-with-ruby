module Study20180216
  module Authenticator
    module Method
      class Authenticate < Base
        def call
          provider = Study20180216::Authenticator::CredentialsProvider.lookup(request.credentials)
          user = provider.authenticate!

          Study20180216::AuthResponse.new(
            status: Study20180216::AuthResponse::Status::OK,
            user: user,
          )
        rescue Study20180216::Authenticator::CredentialsProvider::Error
          Study20180216::AuthResponse.new(
            status: Study20180216::PagesResponse::Status::ERROR,
            error: Study20180216::Error.new(code: 'AuthenticationFailed'),
          )
        end
      end
    end
  end
end
