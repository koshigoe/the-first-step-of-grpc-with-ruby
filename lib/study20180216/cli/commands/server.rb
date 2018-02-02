module Study20180216
  module CLI
    module Commands
      class Server < Hanami::CLI::Command
        SERVICE_LOOKUP = {
          authenticator: Study20180216::Authenticator::ServiceImplementation,
          notebook: Study20180216::Notebook::ServiceImplementation,
        }.freeze

        argument :service,
                 required: true,
                 values: SERVICE_LOOKUP.keys,
                 desc: 'Launch gRPC service server'

        option :bind, required: true, default: '0.0.0.0', desc: 'Binding IP address'
        option :port, required: true, default: 50051, desc: 'Listening PORT number'

        def call(service:, **options)
          server = GRPC::RpcServer.new
          server.add_http2_port("#{options[:bind]}:#{options[:port]}", :this_port_is_insecure)
          server.handle(SERVICE_LOOKUP.fetch(service.to_sym))
          server.run_till_terminated
        end
      end
    end
  end
end
