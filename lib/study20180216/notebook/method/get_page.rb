module Study20180216
  module Notebook
    module Method
      class GetPage < Base
        # ページを取得する。
        #
        # @return [Study20180216::PageResponse] ページオブジェクトを内包するレスポンスオブジェクト
        #
        def call
          page = Storage.new.find(Page.descriptor.name, request.page.id)
          if page
            Study20180216::PageResponse.new(
              status: Study20180216::PagesResponse::Status::OK,
              page: page,
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
