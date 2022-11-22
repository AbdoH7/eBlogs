module Mutations
    class AddComment < Mutations::BaseMutation
      argument :params, Types::Input::CommentInputType, required: true
  
      field :comment, Types::CommentType, null: false
  
      def resolve(params:)
        Pundit.authorize(context[:current_user],Comment,:create?)
        comment_params = Hash params
  
        begin
          comment = Comment.new(comment_params)
          comment.user_id = context[:current_user].id
          comment.save
  
          { comment: comment }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
