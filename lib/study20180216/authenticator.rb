module Study20180216
  module Authenticator
    def self.stub_rpc
      @stub ||= Study20180216::Authenticator::Stub.new('localhost:50052', :this_channel_is_insecure)
    end
  end
end
