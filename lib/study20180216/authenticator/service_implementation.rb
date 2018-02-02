module Study20180216
  module Authenticator
    class ServiceImplementation < Study20180216::Authenticator::Service
      # 登録する。
      #
      # @param [Study20180216::RegisterRequest] request リクエストオブジェクト
      # @param [GRPC::ActiveCall::SingleReqView] context コンテキスト
      # @return [Study20180216::RegisterResponse] レスポンスオブジェクト
      #
      def register(request, context)
        Study20180216::Authenticator::Method::Register.new(request, context).call
      end

      # 認証する。
      #
      # @param [Study20180216::AuthRequest] request リクエストオブジェクト
      # @param [GRPC::ActiveCall::SingleReqView] context コンテキスト
      # @return [Study20180216::AuthResponse] レスポンスオブジェクト
      #
      def authenticate(request, context)
        Study20180216::Authenticator::Method::Authenticate.new(request, context).call
      end
    end
  end
end
