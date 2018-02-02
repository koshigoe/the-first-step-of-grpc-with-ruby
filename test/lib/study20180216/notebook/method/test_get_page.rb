require 'minitest_helper'

describe Study20180216::Notebook::Method::GetPage do
  describe '#call' do
    describe 'when page found' do
      before do
        page = Study20180216::Page.new(id: 'id', title: 'title', content: 'content')
        Study20180216::Storage.new.write(page)
      end

      it 'returns Page' do
        page = Study20180216::Page.new(id: 'id')
        request = Study20180216::PageRequest.new(page: page)
        response = Study20180216::Notebook::Method::GetPage.new(request, nil).call

        assert { response.status == :OK }
        assert { response.page.id = 'id' }
        assert { response.page.title = 'title' }
        assert { response.page.content = 'content' }
      end
    end

    describe 'when page does not found' do
      it 'returns Error' do
        page = Study20180216::Page.new(id: 'id')
        request = Study20180216::PageRequest.new(page: page)
        response = Study20180216::Notebook::Method::GetPage.new(request, nil).call

        assert { response.status == :ERROR }
        assert { response.error.code == 'PageNotFound' }
        assert { response.page.nil? }
      end
    end
  end
end
