# frozen_string_literal: true

module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :rating, Integer
    field :content, String
    field :game_id, Integer, null: false
    field :author_id, Integer, null: false
    field :game, Types::GameType, null: false
    field :author, Types::AuthorType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
