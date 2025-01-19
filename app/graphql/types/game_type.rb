# frozen_string_literal: true

module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String
    field :one_line_reviews, [String], null: true
    field :platforms, [Types::PlatformType], null: true
    field :platform_names, [String], null: true
    field :reviews, [Types::ReviewType], null: true
    field :reviews_count, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def one_line_reviews
      object.reviews.map { |r| "#{r.content} - #{r.author.name}" }
    end

    def platform_names
      object.platforms.map(&:name)
    end

    def reviews_count
      object.reviews.size
    end
  end
end
