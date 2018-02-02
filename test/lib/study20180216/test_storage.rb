require 'minitest_helper'

describe Study20180216::Storage do
  describe '#write' do
    it 'set object to Redis' do
      storage = Study20180216::Storage.new
      page = Study20180216::Page.new(id: 'id', title: 'title', content: 'content')
      storage.write(page)

      assert { storage.redis.get('study20180216.Page:id') == page.to_proto }
    end
  end

  describe '#find' do
    describe 'when object found' do
      it 'returns object' do
        storage = Study20180216::Storage.new
        page = Study20180216::Page.new(id: 'id', title: 'title', content: 'content')
        storage.redis.set('study20180216.Page:id', page.to_proto)

        assert { storage.find('study20180216.Page', 'id') == page }
      end
    end

    describe 'when object does not found' do
      it 'returns nil' do
        storage = Study20180216::Storage.new

        assert { storage.find('study20180216.Page', 'id').nil? }
      end
    end
  end

  describe '#delete' do
    describe 'when object found' do
      before do
        storage = Study20180216::Storage.new
        page = Study20180216::Page.new(id: 'id', title: 'title', content: 'content')
        storage.redis.set('study20180216.Page:id', page.to_proto)
      end

      it 'returns true' do
        storage = Study20180216::Storage.new
        assert { storage.delete('study20180216.Page', 'id') }
      end

      it 'delete object' do
        storage = Study20180216::Storage.new
        storage.delete('study20180216.Page', 'id')
        assert { storage.redis.get('study20180216.Page:id').nil? }
      end
    end

    describe 'when object does not found' do
      it 'returns false' do
        storage = Study20180216::Storage.new

        assert { !storage.delete('study20180216.Page', 'id') }
      end
    end
  end

  describe '#list' do
    describe 'when object found' do
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

      it 'returns objects' do
        storage = Study20180216::Storage.new

        pages = storage.list('study20180216.Page')
        assert { pages.size == 10 }
        10.times do |n|
          assert { pages[n].id == "id-#{n}" }
          assert { pages[n].title == "title-#{n}" }
          assert { pages[n].content == "content-#{n}" }
        end
      end
    end

    describe 'when object does not found' do
      it 'returns nil' do
        storage = Study20180216::Storage.new

        pages = storage.list('study20180216.Page')
        assert { pages == [] }
      end
    end
  end
end
