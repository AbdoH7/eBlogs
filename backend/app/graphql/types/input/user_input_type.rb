module Types
    module Input
      class UserInputType < Types::BaseInputObject
        argument :username, String, required: true
        argument :firstname, String, required: true
        argument :lastname, String, required: true
        argument :email, String, required: true
        argument :password_digest, String, required: true
      end
    end
  end