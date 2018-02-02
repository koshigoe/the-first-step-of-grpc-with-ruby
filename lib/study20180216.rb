module Study20180216
end

require 'grpc'
require 'hanami/cli'
require 'jwt'
require 'redis'
require 'ulid'
require 'notebook_services_pb'
require 'authenticator_services_pb'
require 'study20180216/storage'
require 'study20180216/authenticator'
require 'study20180216/authenticator/service_implementation'
require 'study20180216/authenticator/credentials_provider'
require 'study20180216/authenticator/credentials_provider/base'
require 'study20180216/authenticator/credentials_provider/access_token_credentials'
require 'study20180216/authenticator/credentials_provider/password_credentials'
require 'study20180216/authenticator/method'
require 'study20180216/authenticator/method/base'
require 'study20180216/authenticator/method/authenticate'
require 'study20180216/authenticator/method/register'
require 'study20180216/notebook'
require 'study20180216/notebook/method'
require 'study20180216/notebook/method/base'
require 'study20180216/notebook/method/create_page'
require 'study20180216/notebook/method/get_page'
require 'study20180216/notebook/method/update_page'
require 'study20180216/notebook/method/delete_page'
require 'study20180216/notebook/method/list_pages'
require 'study20180216/notebook/service_implementation'
require 'study20180216/cli'
require 'study20180216/cli/commands'
require 'study20180216/cli/commands/server'
