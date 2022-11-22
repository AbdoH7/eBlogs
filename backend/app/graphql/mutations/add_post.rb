module Mutations
    class AddPost < Mutations::BaseMutation
      argument :params, Types::Input::PostInputType, required: true
  
      field :post, Types::PostType, null: false
  
      def resolve(params:)
        Pundit.authorize(context[:current_user],Post,:create?)
        post_params = Hash params
  
        begin
          
          post = Post.new(post_params)
          post.user_id = context[:current_user].id
          post.save
  
          { post: post }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
