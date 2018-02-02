module Study20180216
  module Notebook
    module Method
      class DeletePage < Base
        # ページを削除する。
        #
        # @return [Study20180216::PageResponse] ページオブジェクトを内包するレスポンスオブジェクト
        #
        def call
          unless authenticate
            response = Study20180216::PageResponse.new(
              status: Study20180216::PagesResponse::Status::ERROR,
              error: Study20180216::Error.new(code: 'AuthenticationFailed'),
            )
            return response
          end

          storage = Storage.new
          page = storage.find(Page.descriptor.name, request.page.id)
          if page
            storage.delete(Page.descriptor.name, page.id)
            Study20180216::PageResponse.new(
              status: Study20180216::PagesResponse::Status::OK,
              page: nil,
            )
          else
            Study20180216::PageResponse.new(
              status: Study20180216::PagesResponse::Status::ERROR,
              error: Study20180216::Error.new(
                code: 'PageNotFound',
              ),
            )
          end
        end
      end
    end
  end
end
