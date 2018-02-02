require 'minitest_helper'

describe Study20180216::Authenticator::Method::Authenticate do
  describe '#call' do
    before do
      user = Study20180216::User.new(id: 'user', name: 'minitest')
      storage = Study20180216::Storage.new
      storage.redis.set('study20180216.User:user', user.to_proto)
    end

    describe 'password credentials' do
      before do
        password = Study20180216::Password.new(id: 'user', hashed_password: Digest::SHA256.hexdigest('pass'))
        storage = Study20180216::Storage.new
        storage.redis.set('study20180216.Password:user', password.to_proto)
      end

      describe 'given correct password' do
        it '認証成功レスポンスを返す' do
          request = Study20180216::AuthRequest.new(
            credentials: Study20180216::Credentials.new(
              password: Study20180216::PasswordCredentials.new(
                password: Study20180216::Password.new(
                  id: 'user',
                  raw_password: 'pass',
                ),
              ),
            ),
          )
          response = Study20180216::Authenticator::Method::Authenticate.new(request, nil).call

          assert { response.status == :OK }
          assert { !response.user.nil? }
          assert { response.error.nil? }
        end
      end

      describe 'given incorrect password' do
        it '認証失敗レスポンスを返す' do
          request = Study20180216::AuthRequest.new(
            credentials: Study20180216::Credentials.new(
              password: Study20180216::PasswordCredentials.new(
                password: Study20180216::Password.new(
                  id: 'user',
                  raw_password: 'incorrect',
                ),
              ),
            ),
          )
          response = Study20180216::Authenticator::Method::Authenticate.new(request, nil).call

          assert { response.status == :ERROR }
          assert { response.user.nil? }
          assert { !response.error.nil? }
        end
      end
    end

    describe 'token credentials' do
      describe 'given correct password' do
        it '認証成功レスポンスを返す' do
          key = OpenSSL::PKey::EC.new(Base64.strict_decode64(ENV['JWT_SIGNING_KEY']))
          token = JWT.encode({ sub: 'user' }, key, 'ES256')

          request = Study20180216::AuthRequest.new(
            credentials: Study20180216::Credentials.new(
              access_token: Study20180216::AccessTokenCredentials.new(
                access_token: Study20180216::AccessToken.new(token: token),
              ),
            ),
          )
          response = Study20180216::Authenticator::Method::Authenticate.new(request, nil).call

          assert { response.status == :OK }
          assert { !response.user.nil? }
          assert { response.error.nil? }
        end
      end

      describe 'given incorrect password' do
        it '認証失敗レスポンスを返す' do
          request = Study20180216::AuthRequest.new(
            credentials: Study20180216::Credentials.new(
              access_token: Study20180216::AccessTokenCredentials.new(
                access_token: Study20180216::AccessToken.new(token: ''),
              ),
            ),
          )
          response = Study20180216::Authenticator::Method::Authenticate.new(request, nil).call

          assert { response.status == :ERROR }
          assert { response.user.nil? }
          assert { !response.error.nil? }
        end
      end
    end
  end
end
