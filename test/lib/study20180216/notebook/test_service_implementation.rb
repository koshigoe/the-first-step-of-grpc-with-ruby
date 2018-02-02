require 'minitest_helper'

describe Study20180216::Notebook::ServiceImplementation do
  describe '#create_page' do
    it 'delegate to Study20180216::Notebook::Method::CreatePage#call' do
      request = MiniTest::Mock.new
      context = MiniTest::Mock.new
      response = MiniTest::Mock.new

      method_mock = MiniTest::Mock.new.expect(:call, response)
      method_mock_gen = MiniTest::Mock.new.expect(:call, method_mock, [request, context])
      Study20180216::Notebook::Method::CreatePage.stub(:new, method_mock_gen) do
        service = Study20180216::Notebook::ServiceImplementation.new
        service.create_page(request, context)
      end
      assert { method_mock_gen.verify }
      assert { method_mock.verify }
    end
  end

  describe '#get_page' do
    it 'delegate to Study20180216::Notebook::Method::GetPage#call' do
      request = MiniTest::Mock.new
      context = MiniTest::Mock.new
      response = MiniTest::Mock.new

      method_mock = MiniTest::Mock.new.expect(:call, response)
      method_mock_gen = MiniTest::Mock.new.expect(:call, method_mock, [request, context])
      Study20180216::Notebook::Method::GetPage.stub(:new, method_mock_gen) do
        service = Study20180216::Notebook::ServiceImplementation.new
        service.get_page(request, context)
      end
      assert { method_mock_gen.verify }
      assert { method_mock.verify }
    end
  end

  describe '#update_page' do
    it 'delegate to Study20180216::Notebook::Method::UpdatePage#call' do
      request = MiniTest::Mock.new
      context = MiniTest::Mock.new
      response = MiniTest::Mock.new

      method_mock = MiniTest::Mock.new.expect(:call, response)
      method_mock_gen = MiniTest::Mock.new.expect(:call, method_mock, [request, context])
      Study20180216::Notebook::Method::UpdatePage.stub(:new, method_mock_gen) do
        service = Study20180216::Notebook::ServiceImplementation.new
        service.update_page(request, context)
      end
      assert { method_mock_gen.verify }
      assert { method_mock.verify }
    end
  end

  describe '#delete_page' do
    it 'delegate to Study20180216::Notebook::Method::DeletePage#call' do
      request = MiniTest::Mock.new
      context = MiniTest::Mock.new
      response = MiniTest::Mock.new

      method_mock = MiniTest::Mock.new.expect(:call, response)
      method_mock_gen = MiniTest::Mock.new.expect(:call, method_mock, [request, context])
      Study20180216::Notebook::Method::DeletePage.stub(:new, method_mock_gen) do
        service = Study20180216::Notebook::ServiceImplementation.new
        service.delete_page(request, context)
      end
      assert { method_mock_gen.verify }
      assert { method_mock.verify }
    end
  end

  describe '#list_pages' do
    it 'delegate to Study20180216::Notebook::Method::ListPages#call' do
      request = MiniTest::Mock.new
      context = MiniTest::Mock.new
      response = MiniTest::Mock.new

      method_mock = MiniTest::Mock.new.expect(:call, response)
      method_mock_gen = MiniTest::Mock.new.expect(:call, method_mock, [request, context])
      Study20180216::Notebook::Method::ListPages.stub(:new, method_mock_gen) do
        service = Study20180216::Notebook::ServiceImplementation.new
        service.list_pages(request, context)
      end
      assert { method_mock_gen.verify }
      assert { method_mock.verify }
    end
  end
end
