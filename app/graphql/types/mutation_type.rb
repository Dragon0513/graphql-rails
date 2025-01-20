# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_game, mutation: Mutations::CreateGame
    field :delete_game, mutation: Mutations::DeleteGame
  end
end
