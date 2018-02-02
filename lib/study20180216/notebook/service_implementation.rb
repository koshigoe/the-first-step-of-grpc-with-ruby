module Study20180216
  module Notebook
    class ServiceImplementation < Study20180216::Notebook::Service
      # ページを作成する。
      #
      # @param [Study20180216::PageRequest] request リクエストオブジェクト
      # @param [GRPC::ActiveCall::SingleReqView] context コンテキスト
      # @return [Study20180216::PageResponse] レスポンスオブジェクト
      #
      def create_page(request, context)
        Study20180216::Notebook::Method::CreatePage.new(request, context).call
      end

      # ページを取得する。
      #
      # @param [Study20180216::PageRequest] request リクエストオブジェクト
      # @param [GRPC::ActiveCall::SingleReqView] context コンテキスト
      # @return [Study20180216::PageResponse] レスポンスオブジェクト
      #
      def get_page(request, context)
        Study20180216::Notebook::Method::GetPage.new(request, context).call
      end

      # ページを更新する。
      #
      # @param [Study20180216::PageRequest] request リクエストオブジェクト
      # @param [GRPC::ActiveCall::SingleReqView] context コンテキスト
      # @return [Study20180216::PageResponse] レスポンスオブジェクト
      #
      def update_page(request, context)
        Study20180216::Notebook::Method::UpdatePage.new(request, context).call
      end

      # ページを削除する。
      #
      # @param [Study20180216::PageRequest] request リクエストオブジェクト
      # @param [GRPC::ActiveCall::SingleReqView] context コンテキスト
      # @return [Study20180216::PageResponse] レスポンスオブジェクト
      #
      def delete_page(request, context)
        Study20180216::Notebook::Method::DeletePage.new(request, context).call
      end

      # ページの一覧を取得する。
      #
      # @param [Study20180216::PagesRequest] request リクエストオブジェクト
      # @param [GRPC::ActiveCall::SingleReqView] context コンテキスト
      # @return [Study20180216::PagesResponse] レスポンスオブジェクト
      #
      def list_pages(request, context)
        Study20180216::Notebook::Method::ListPages.new(request, context).call
      end
    end
  end
end
