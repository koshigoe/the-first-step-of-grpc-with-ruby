require 'minitest_helper'

describe Study20180216::Notebook::Method::ListPages do
  describe '#call' do
    describe 'when page found' do
      before do
        storage = Study20180216::Storage.new
        10.times do |n|
          page = Study20180216::Page.new(
            id: "id-#{n}",
            title: "title-#{n}",
            content: "content-#{n}",
          )
          storage.write(page)
        end
      end

      it 'returns Pages' do
        request = Study20180216::PagesRequest.new
        response = Study20180216::Notebook::Method::ListPages.new(request, nil).call

        assert { response.status == :OK }
        10.times do |n|
          assert { response.pages.members[n].id == "id-#{n}" }
          assert { response.pages.members[n].title == "title-#{n}" }
          assert { response.pages.members[n].content == "content-#{n}" }
        end
      end
    end

    describe 'when page does not found' do
      it 'returns empty Pages' do
        request = Study20180216::PagesRequest.new
        response = Study20180216::Notebook::Method::ListPages.new(request, nil).call

        assert { response.status == :OK }
        assert { response.pages.members == [] }
      end
    end
  end
end
