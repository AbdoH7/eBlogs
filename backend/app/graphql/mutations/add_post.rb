module Mutations
    class AddPost < Mutations::BaseMutation
      argument :params, Types::Input::PostInputType, required: true
  
      field :post, Types::PostType, null: false
  
      def resolve(params:)
        post_params = Hash params
  
        begin
          post = Post.create!(post_params)
  
          { post: post }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
