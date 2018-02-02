require 'minitest_helper'

describe Study20180216::Authenticator::ServiceImplementation do
  describe '#register' do
    it 'delegate to Study20180216::Authenticator::Method::Register#call' do
      request = MiniTest::Mock.new
      context = MiniTest::Mock.new
      response = MiniTest::Mock.new

      method_mock = MiniTest::Mock.new.expect(:call, response)
      method_mock_gen = MiniTest::Mock.new.expect(:call, method_mock, [request, context])
      Study20180216::Authenticator::Method::Register.stub(:new, method_mock_gen) do
        service = Study20180216::Authenticator::ServiceImplementation.new
        service.register(request, context)
      end
      assert { method_mock_gen.verify }
      assert { method_mock.verify }
    end
  end

  describe '#authenticate' do
    it 'delegate to Study20180216::Authenticator::Method::Authenticate#call' do
      request = MiniTest::Mock.new
      context = MiniTest::Mock.new
      response = MiniTest::Mock.new

      method_mock = MiniTest::Mock.new.expect(:call, response)
      method_mock_gen = MiniTest::Mock.new.expect(:call, method_mock, [request, context])
      Study20180216::Authenticator::Method::Authenticate.stub(:new, method_mock_gen) do
        service = Study20180216::Authenticator::ServiceImplementation.new
        service.authenticate(request, context)
      end
      assert { method_mock_gen.verify }
      assert { method_mock.verify }
    end
  end
end
