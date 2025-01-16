class GamePlatform < ApplicationRecord
  self.table_name = 'games_platforms'
  belongs_to :game
  belongs_to :platform
end
