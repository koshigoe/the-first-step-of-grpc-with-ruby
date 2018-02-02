module Study20180216
  module Authenticator
    module CredentialsProvider
      class Base
        # @return [Object] 認証情報
        attr_reader :credentials
        # @return [Study20180216::User] 認証されたユーザー
        attr_reader :user

        # 初期化。
        #
        # @param [Object] credentials 認証情報
        #
        def initialize(credentials)
          @credentials = credentials
          @user = nil
        end

        # 認証する。
        #
        # @return [Study20180216::User] 認証されたユーザー
        # @raise [Study20180216::Authenticator::CredentialsProvider::AuthenticationFailed] 認証できなかった場合
        #
        def authenticate!
          raise AuthenticationFailed unless verify
          user
        end
      end
    end
  end
end
