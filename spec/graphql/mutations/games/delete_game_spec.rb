# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::DeleteGame do
  subject do
    GraphqlRailsSchema.execute(
      query_string,
      variables: variables
    )
  end

  let(:query_string) do
    <<-GRAPHQL
      mutation DeleteGame($id: ID!){
        deleteGame(input: {
            id: $id
        })
        {
          game {
            title
          }
          errors
        }
    }
    GRAPHQL
  end

  describe 'deleteGame' do
    context 'with valid id' do
      let!(:game) { create(:game) }
      let(:variables) { { id: game.id } }

      it 'deletes the game' do
        expect { subject }.to change { Game.count }.by(-1)
      end

      it 'returns deleted game data' do
        game_data = subject['data']['deleteGame']
        expect(game_data['game']['title']).to eq(game.title)
        expect(game_data['errors']).to be_empty
      end
    end

    context 'with invalid id' do
      let!(:game) { create(:game) }
      let(:variables) { { id: 0 } }

      it 'does not delete the game' do
        expect { subject }.not_to change { Game.count }
      end

      it 'returns error' do
        game_data = subject['data']['deleteGame']
        expect(game_data['game']).to be_nil
        expect(game_data['errors']).not_to be_empty
      end
    end
  end
end
