module Study20180216
  module Notebook
    module Method
      class Base
        # @return [Object] request gRPC リクエストオブジェクト
        attr_reader :request
        # @return [GRPC::ActiveCall::SingleReqView] コンテキスト
        attr_reader :context
        # @return [Study20180216::User] 認証されたユーザー
        attr_reader :current_user

        # 初期化。
        #
        # @param [Object] request gRPC リクエストオブジェクト
        # @param [GRPC::ActiveCall::SingleReqView] context コンテキスト
        #
        def initialize(request, context)
          @request = request
          @context = context
          @current_user = nil
        end

        # rpc に対応する処理を実装する。
        #
        # @return [Object] gRPC レスポンスオブジェクト
        #
        def call
          raise NotImplementedError
        end

        private

        # 認証する。
        #
        # @return [Study20180216::User, nil] 認証できたユーザーもしくは nil
        #
        def authenticate
          auth_request = Study20180216::AuthRequest.new(credentials: request.credentials)
          auth_response = Study20180216::Authenticator.stub_rpc.authenticate(auth_request)

          return nil if auth_response.error

          @current_user = auth_response.user
        end
      end
    end
  end
end
