module Study20180216
  module Authenticator
    module CredentialsProvider
      class Error < StandardError; end
      class UnsupportedCredentials < Error; end
      class AuthenticationFailed < Error; end

      # 認証器を生成する。
      #
      # @param [Study20180216::Credentials] credentials 認証情報コンテナ
      # @return [Study20180216::Authenticator::AuthenticationProvider::Base] 認証器オブジェクト
      # @raise [Study20180216::Authenticator::AuthenticationProvider::UnsupportedCredentials] 認証情報コンテナに含まれる認証情報がサポート外だった場合
      #
      def self.lookup(credentials)
        case
        when credentials.respond_to?(:password) && credentials.password
          PasswordCredentials.new(credentials.password)
        when credentials.respond_to?(:access_token) && credentials.access_token
          AccessTokenCredentials.new(credentials.access_token)
        else
          raise UnsupportedCredentials
        end
      end
    end
  end
end
