require 'rails_helper'

RSpec.describe Mutations::CreateGame do
  subject(:graphql!) do
    GraphqlRailsSchema.execute(
      query_string,
      variables: variables
    )
  end

  let(:query_string) do
    <<-GRAPHQL
    mutation CreateGame($attributes: GameInput!) {
      createGame(input: {
        attributes: $attributes
      })
      {
        game {
          id,
          title,
          platformNames
        }
        errors
      }
    }
    GRAPHQL
  end

  let(:platform1) { create(:platform) }
  let(:platform2) { create(:platform) }

  context 'with valid params' do
    let(:variables) do
      {
        attributes: {
          title: 'XCOM5',
          description: 'Lorem ipsum',
          platformIds: [platform1.id, platform2.id]
        }
      }
    end

    it 'creates a game' do
      expect { subject }.to change { Game.count }.by(1)
    end

    it 'returns game data' do
      game_data = subject['data']['createGame']
      expect(game_data['game']['id']).not_to be_nil
      expect(game_data['game']['title']).to eq(variables[:attributes][:title])
      expect(game_data['game']['platformNames']).to eq([platform1.name, platform2.name])
      expect(game_data['errors']).to be_empty
    end
  end

  context 'with non existing platform id' do
    let(:variables) do
      {
        attributes: {
          title: 'XCOM5',
          description: 'Lorem ipsum',
          platformIds: [platform1.id, 0]
        }
      }
    end

    it 'does not create a game' do
      expect { subject }.not_to change { Game.count }
    end

    it 'returns errors' do
      game_data = subject['data']['createGame']
      expect(game_data['game']).to be_nil
      expect(game_data['errors']).not_to be_empty
    end
  end
end
