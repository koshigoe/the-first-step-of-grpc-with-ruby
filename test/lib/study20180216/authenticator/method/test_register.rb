require 'minitest_helper'

describe Study20180216::Authenticator::Method::Register do
  describe '#call' do
    it 'creates User' do
      request = Study20180216::RegisterRequest.new(
        user: Study20180216::User.new(name: 'user'),
        password: Study20180216::Password.new(raw_password: 'pass'),
      )
      response = Study20180216::Authenticator::Method::Register.new(request, nil).call

      storage = Study20180216::Storage.new
      assert { storage.find('study20180216.User', response.user.id) }
    end

    it 'creates Password' do
      request = Study20180216::RegisterRequest.new(
        user: Study20180216::User.new(name: 'user'),
        password: Study20180216::Password.new(raw_password: 'pass'),
      )
      response = Study20180216::Authenticator::Method::Register.new(request, nil).call

      storage = Study20180216::Storage.new
      assert { storage.find('study20180216.Password', response.user.id) }
    end

    it 'returns RegisterResponse' do
      request = Study20180216::RegisterRequest.new(
        user: Study20180216::User.new(name: 'user'),
        password: Study20180216::Password.new(raw_password: 'pass'),
      )
      response = Study20180216::Authenticator::Method::Register.new(request, nil).call

      assert { response.is_a?(Study20180216::RegisterResponse) }
      assert { response.status == :OK }
      assert { response.user.name == 'user' }
    end
  end
end
