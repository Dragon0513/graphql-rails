class Mutations::CreateGame < Mutations::BaseMutation
  argument :attributes, Types::GameInputType, required: true

  field :game, Types::GameType
  field :errors, [String]

  def resolve(attributes:)
    game = Game.create!(attributes.to_h)
    {
      game: game,
      errors: []
    }
  rescue => e
    {
      game: nil,
      errors: [e.message]
    }
  end
end
