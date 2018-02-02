module Study20180216
  module Authenticator
    module Method
      class Register < Base
        def call
          storage = Study20180216::Storage.new

          new_user = Study20180216::User.new(
            id: ULID.generate,
            name: request.user.name,
          )
          password = Study20180216::Password.new(
            id: new_user.id,
            raw_password: request.password.raw_password,
          )

          storage.write(new_user)
          storage.write(password)

          Study20180216::RegisterResponse.new(
            status: Study20180216::AuthResponse::Status::OK,
            user: new_user,
          )
        end
      end
    end
  end
end
