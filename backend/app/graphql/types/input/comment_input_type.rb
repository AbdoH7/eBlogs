module Types
    module Input
      class CommentInputType < Types::BaseInputObject
        argument :user_id, Int, required: true
        argument :post_id, Int, required: true
        argument :comment_body, String, required: true
      end
    end
  end
