module Study20180216
  module Notebook
    module Method
      class CreatePage < Base
        # ページを作成する。
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

          new_page = Study20180216::Page.new(
            id: ULID.generate,
            title: request.page.title,
            content: request.page.content,
            editor: current_user,
          )
          Storage.new.write(new_page)

          Study20180216::PageResponse.new(
            status: Study20180216::PagesResponse::Status::OK,
            page: new_page,
          )
        end
      end
    end
  end
end
