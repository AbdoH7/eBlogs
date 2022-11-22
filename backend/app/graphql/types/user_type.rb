# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String
    field :firstname, String
    field :lastname, String
    field :email, String
    field :password_digest, String
    field :posts, [Types::PostType]
    field :comments, [Types::CommentType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :token, String
  end
end
