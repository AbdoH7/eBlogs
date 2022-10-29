module Types
    module Input
      class PostInputType < Types::BaseInputObject
        argument :user_id, Int, required: true
        argument :post_title, String, required: true
        argument :post_body, String, required: true
      end
    end
  end
