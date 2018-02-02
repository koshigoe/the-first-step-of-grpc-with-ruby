require 'minitest_helper'

describe Study20180216::Authenticator::CredentialsProvider do
  describe '.lookup' do
    describe 'given valid credentials' do
      it 'returns authenticator' do
        password = Study20180216::Password.new(id: 'user', raw_password: 'pass')
        credentials = Study20180216::PasswordCredentials.new(password: password)
        authenticator = Study20180216::Authenticator::CredentialsProvider.lookup(credentials)

        assert { authenticator.is_a?(Study20180216::Authenticator::CredentialsProvider::PasswordCredentials) }
      end
    end

    describe 'given nil' do
      it 'raise exception' do
        begin
          Study20180216::Authenticator::CredentialsProvider.lookup(nil)
        rescue => e
          assert { e.is_a? Study20180216::Authenticator::CredentialsProvider::UnsupportedCredentials }
        else
          assert { false }
        end
      end
    end
  end
end
