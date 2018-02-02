require 'minitest_helper'

describe Study20180216::Notebook::Method::UpdatePage do
  describe '#call' do
    describe 'given correct credentials' do
      around do |test|
        @credentials = Study20180216::Credentials.new(
          access_token: Study20180216::AccessTokenCredentials.new(
            access_token: Study20180216::AccessToken.new(
              token: 'access-token',
            ),
          ),
        )

        auth_request = Study20180216::AuthRequest.new(credentials: @credentials)
        auth_response = Study20180216::AuthResponse.new(
          status: Study20180216::AuthResponse::Status::OK,
          user: Study20180216::User.new(id: 'user', name: 'minitest'),
        )
        auth_stub_mock = MiniTest::Mock.new.expect(:authenticate, auth_response, [auth_request])
        Study20180216::Authenticator.stub(:stub_rpc, auth_stub_mock) do
          test.call
        end
        assert { auth_stub_mock.verify }
      end

      describe 'when page found' do
        before do
          page = Study20180216::Page.new(id: 'id', title: 'title', content: 'content')
          Study20180216::Storage.new.write(page)
        end

        it 'return Page' do
          page = Study20180216::Page.new(
            id: 'id',
            title: 'new-title',
            content: 'new-content',
          )
          request = Study20180216::PageRequest.new(
            credentials: @credentials,
            page: page,
          )
          response = Study20180216::Notebook::Method::UpdatePage.new(request, nil).call

          assert { response.status == :OK }
          assert { response.page.id == 'id' }
          assert { response.page.title == 'new-title' }
          assert { response.page.content == 'new-content' }
          assert { response.page.editor == Study20180216::User.new(id: 'user', name: 'minitest') }
        end

        it 'update Page' do
          page = Study20180216::Page.new(
            id: 'id',
            title: 'new-title',
            content: 'new-content',
          )
          request = Study20180216::PageRequest.new(
            credentials: @credentials,
            page: page,
          )
          response = Study20180216::Notebook::Method::UpdatePage.new(request, nil).call

          storage = Study20180216::Storage.new
          updated_page = storage.find('study20180216.Page', response.page.id)

          assert { updated_page.id == 'id' }
          assert { updated_page.title == 'new-title' }
          assert { updated_page.content == 'new-content' }
        end
      end

      describe 'when page does not found' do
        it 'return Error' do
          page = Study20180216::Page.new(
            id: 'id',
            title: 'new-title',
            content: 'new-content',
          )
          request = Study20180216::PageRequest.new(
            credentials: @credentials,
            page: page,
          )
          response = Study20180216::Notebook::Method::UpdatePage.new(request, nil).call

          assert { response.status == :ERROR }
          assert { response.error.code == 'PageNotFound' }
        end
      end
    end

    describe 'without credentials' do
      around do |test|
        auth_request = Study20180216::AuthRequest.new
        auth_response = Study20180216::AuthResponse.new(
          status: Study20180216::AuthResponse::Status::ERROR,
          error: Study20180216::Error.new(code: 'AuthenticationFailed'),
        )
        auth_stub_mock = MiniTest::Mock.new.expect(:authenticate, auth_response, [auth_request])
        Study20180216::Authenticator.stub(:stub_rpc, auth_stub_mock) do
          test.call
        end
        assert { auth_stub_mock.verify }
      end

      it 'returns Error' do
        page = Study20180216::Page.new(id: 'id')
        request = Study20180216::PageRequest.new(page: page)
        response = Study20180216::Notebook::Method::UpdatePage.new(request, nil).call

        assert { response.status == :ERROR }
        assert { response.error.code == 'AuthenticationFailed' }
      end
    end
  end
end
