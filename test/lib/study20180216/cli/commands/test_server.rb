require 'minitest_helper'

describe Study20180216::CLI::Commands::Server do
  describe '#call' do
    it 'launch gPRC server' do
      rpc_mock = MiniTest::Mock.new
      rpc_mock.expect(:add_http2_port, nil, ['0.0.0.0:50051', :this_port_is_insecure])
      rpc_mock.expect(:handle, nil, [Study20180216::Notebook::ServiceImplementation])
      rpc_mock.expect(:run_till_terminated, nil)

      GRPC::RpcServer.stub(:new, rpc_mock) do
        Study20180216::CLI::Commands::Server.new(command_name: 'server').call(service: 'notebook', bind: '0.0.0.0', port: 50051)
      end

      assert { rpc_mock.verify }
    end
  end
end
