require 'minitest_helper'

describe Study20180216::Authenticator do
  describe '.stub_rpc' do
    it 'returns an instance of Study20180216::Authenticator::Stub' do
      assert { Study20180216::Authenticator.stub_rpc.is_a? Study20180216::Authenticator::Stub }
    end
  end
end
