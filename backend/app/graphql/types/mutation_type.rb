module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :add_user, mutation: Mutations::AddUser
    field :add_post, mutation: Mutations::AddPost
    field :add_comment, mutation: Mutations::AddComment
  end
end
