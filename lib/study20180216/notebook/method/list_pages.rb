module Study20180216
  module Notebook
    module Method
      class ListPages < Base
        # ページを取得する。
        #
        # @return [Study20180216::PagesResponse] ページオブジェクトを内包するレスポンスオブジェクト
        #
        def call
          pages = Study20180216::Pages.new(members: Storage.new.list(Page.descriptor.name))
          Study20180216::PagesResponse.new(
            status: Study20180216::PagesResponse::Status::OK,
            pages: pages,
          )
        end
      end
    end
  end
end
