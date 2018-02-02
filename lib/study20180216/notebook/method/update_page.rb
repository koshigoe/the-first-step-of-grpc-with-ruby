module Study20180216
  module Notebook
    module Method
      class UpdatePage < Base
        # ページを更新する。
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

          page = Storage.new.find(Page.descriptor.name, request.page.id)
          if page
            page.title = request.page.title
            page.content = request.page.content
            page.editor = current_user
            Storage.new.write(page)
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
