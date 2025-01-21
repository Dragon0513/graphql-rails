# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :games, [Types::GameType], null: false

    def games
      Game.all
    end

    field :game, Types::GameType, null: false do
      argument :id, ID, required: true
    end

    def game(id:)
      Game.find(id)
    end

    field :reviews, [Types::ReviewType], null: false

    def reviews
      Review.all
    end

    field :review, Types::ReviewType, null: false do
      argument :id, ID, required: true
    end

    def review(id:)
      Review.find(id)
    end

    field :platforms, [Types::PlatformType], null: false

    def platforms
      Platform.all
    end

    field :platform, Types::PlatformType, null: false do
      argument :id, ID, required: true
    end

    def platform(id:)
      Platform.find(id)
    end
  end
end
