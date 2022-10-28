module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
    #field :user, resolver: Queries::FetchUser
    #field :fetch_users, resolver: Queries::FetchUsers

    field :users, [UserType], null: false, description: 'List all users'
    def users
      User.all
    end

    field :user, Types::UserType, null:false do
      argument :id, ID, required: false
    end
    def user(id:)
      User.find(id)
    end

    field :posts, [PostType], null: false, description: 'List all posts'
    def posts
      Post.all
    end

    field :post, Types::PostType, null:false do
      argument :id, ID, required: false
    end
    def post(id:)
      Post.find(id)
    end
    
    field :comments, [CommentType], null: false, description: 'List all comments'
    def comments
      Comment.all
    end

    field :comment, Types::CommentType, null:false do
      argument :id, ID, required: false
    end
    def comment(id:)
      Comment.find(id)
    end
  end
end
