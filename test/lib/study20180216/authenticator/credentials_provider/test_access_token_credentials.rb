require 'minitest_helper'

describe Study20180216::Authenticator::CredentialsProvider::AccessTokenCredentials do
  describe '#authenticate!' do
    before do
      user = Study20180216::User.new(id: 'user', name: 'minitest')
      storage = Study20180216::Storage.new
      storage.redis.set('study20180216.User:user', user.to_proto)
    end

    describe 'given correct token' do
      it 'returns authenticated user' do
        key = OpenSSL::PKey::EC.new(Base64.strict_decode64(ENV['JWT_SIGNING_KEY']))
        token = JWT.encode({ sub: 'user' }, key, 'ES256')

        access_token = Study20180216::AccessToken.new(token: token)
        credentials = Study20180216::AccessTokenCredentials.new(access_token: access_token)
        authenticator = Study20180216::Authenticator::CredentialsProvider::AccessTokenCredentials.new(credentials)

        assert { authenticator.authenticate! == Study20180216::User.new(id: 'user', name: 'minitest') }
      end
    end

    describe 'given incorrect token' do
      it 'raise exception' do
        access_token = Study20180216::AccessToken.new(token: '')
        credentials = Study20180216::AccessTokenCredentials.new(access_token: access_token)
        authenticator = Study20180216::Authenticator::CredentialsProvider::AccessTokenCredentials.new(credentials)

        begin
          authenticator.authenticate!
        rescue => e
          assert { e.is_a? Study20180216::Authenticator::CredentialsProvider::AuthenticationFailed }
        else
          assert { false }
        end
      end
    end
  end
end
