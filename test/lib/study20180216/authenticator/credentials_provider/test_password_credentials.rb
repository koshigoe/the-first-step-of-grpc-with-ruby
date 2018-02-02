require 'minitest_helper'

describe Study20180216::Authenticator::CredentialsProvider::PasswordCredentials do
  describe '#authenticate!' do
    before do
      user = Study20180216::User.new(id: 'user', name: 'minitest')
      storage = Study20180216::Storage.new
      storage.redis.set('study20180216.User:user', user.to_proto)
    end

    describe 'given correct id and password' do
      before do
        password = Study20180216::Password.new(id: 'user', hashed_password: Digest::SHA256.hexdigest('pass'))
        storage = Study20180216::Storage.new
        storage.redis.set('study20180216.Password:user', password.to_proto)
      end

      it 'returns authenticated user' do
        password = Study20180216::Password.new(id: 'user', raw_password: 'pass')
        credentials = Study20180216::PasswordCredentials.new(password: password)
        authenticator = Study20180216::Authenticator::CredentialsProvider::PasswordCredentials.new(credentials)

        assert { authenticator.authenticate! == Study20180216::User.new(id: 'user', name: 'minitest') }
      end
    end

    describe 'given incorrect password' do
      before do
        password = Study20180216::Password.new(id: 'user', hashed_password: Digest::SHA256.hexdigest('pass'))
        storage = Study20180216::Storage.new
        storage.redis.set('study20180216.Password:user', password.to_proto)
      end

      it 'raise exception' do
        password = Study20180216::Password.new(id: 'user', raw_password: 'incorrect')
        credentials = Study20180216::PasswordCredentials.new(password: password)
        authenticator = Study20180216::Authenticator::CredentialsProvider::PasswordCredentials.new(credentials)

        begin
          authenticator.authenticate!
        rescue => e
          assert { e.is_a? Study20180216::Authenticator::CredentialsProvider::AuthenticationFailed }
        else
          assert { false }
        end
      end
    end

    describe 'given incorrect id' do
      before do
        password = Study20180216::Password.new(id: 'user', hashed_password: Digest::SHA256.hexdigest('pass'))
        storage = Study20180216::Storage.new
        storage.redis.set('study20180216.Password:user', password.to_proto)
      end

      it 'raise exception' do
        password = Study20180216::Password.new(id: 'incorrect', raw_password: 'pass')
        credentials = Study20180216::PasswordCredentials.new(password: password)
        authenticator = Study20180216::Authenticator::CredentialsProvider::PasswordCredentials.new(credentials)

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
