module Types::Queries
    class FetchPosts < Types::Queries::BaseQuery
  
      type [Types::PostType], null: false
  
      def resolve
        #Post.all.order(created_at: :desc)
        post = PostPolicy::Scope.new(context[:current_user], Post).resolve
      end
    end
  end
