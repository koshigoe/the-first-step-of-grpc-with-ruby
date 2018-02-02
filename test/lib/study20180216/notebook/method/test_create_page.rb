require 'minitest_helper'

describe Study20180216::Notebook::Method::CreatePage do
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

      it 'returns an instance of PageResponse' do
        page = Study20180216::Page.new(title: 'TITLE', content: 'CONTENT')
        request = Study20180216::PageRequest.new(
          credentials: @credentials,
          page: page,
        )
        response = Study20180216::Notebook::Method::CreatePage.new(request, nil).call

        assert { response.is_a? Study20180216::PageResponse }
      end

      it 'status of PageResponse is OK' do
        page = Study20180216::Page.new(title: 'TITLE', content: 'CONTENT')
        request = Study20180216::PageRequest.new(
          credentials: @credentials,
          page: page,
        )
        response = Study20180216::Notebook::Method::CreatePage.new(request, nil).call

        assert { response.status == :OK }
      end

      it 'create Page with requested parameters' do
        page = Study20180216::Page.new(title: 'TITLE', content: 'CONTENT')
        request = Study20180216::PageRequest.new(
          credentials: @credentials,
          page: page,
        )
        response = Study20180216::Notebook::Method::CreatePage.new(request, nil).call

        assert { !response.page.id.empty? }
        assert { response.page.title == 'TITLE' }
        assert { response.page.content == 'CONTENT' }
        assert { response.page.editor == Study20180216::User.new(id: 'user', name: 'minitest') }
      end

      it 'persists Page' do
        page = Study20180216::Page.new(title: 'TITLE', content: 'CONTENT')
        request = Study20180216::PageRequest.new(
          credentials: @credentials,
          page: page,
        )
        response = Study20180216::Notebook::Method::CreatePage.new(request, nil).call

        storage = Study20180216::Storage.new
        new_page = storage.find('study20180216.Page', response.page.id)

        assert { !new_page.id.nil? }
        assert { new_page.title == 'TITLE' }
        assert { new_page.content == 'CONTENT' }
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
        page = Study20180216::Page.new(title: 'TITLE', content: 'CONTENT')
        request = Study20180216::PageRequest.new(page: page)
        response = Study20180216::Notebook::Method::CreatePage.new(request, nil).call

        assert { response.status == :ERROR }
        assert { response.error.code == 'AuthenticationFailed' }
      end
    end
  end
end
