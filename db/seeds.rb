# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Game.destroy_all

game1 = Game.create!( title: 'XCOM: UFO Defense')
game2 = Game.create!( title: 'XCOM: Terror from the Deep')
game3 = Game.create!( title: 'XCOM: Apocalypse')
game4 = Game.create!( title: 'XCOM: Enemy Unknown')
game5 = Game.create!( title: 'XCOM2')

Platform.destroy_all
platform1 = Platform.create!( name: 'DOS')
platform2 = Platform.create!( name: 'Amiga')
platform3 = Platform.create!( name: 'PS3')
platform4 = Platform.create!( name: 'Xbox 360')

GamePlatform.destroy_all
GamePlatform.create!([
  { game_id: game1.id, platform_id: platform1.id },
  { game_id: game1.id, platform_id: platform2.id },
  { game_id: game2.id, platform_id: platform1.id },
  { game_id: game3.id, platform_id: platform1.id },
  { game_id: game4.id, platform_id: platform3.id },
  { game_id: game5.id, platform_id: platform4.id },
])

Author.destroy_all
author1 = Author.create!( name: 'GameSpot')
author2 = Author.create!( name: 'PC Gamer')
author3 = Author.create!( name: 'Game Spy')

Review.destroy_all
Review.create!([
  { rating: 9,
    game_id: game1.id,
    author_id: author1.id,
    content: 'Resistance is futile' },
  { rating: 8,
    game_id: game2.id,
    author_id: author1.id,
    content: 'this is exactly the same game as UFO Defense, only much more difficult.' },
  { rating: 7,
    game_id: game3.id,
    author_id: author1.id,
    content: 'colorful, almost humorous tone,' },
  { rating: 6,
    game_id: game4.id,
    author_id: author2.id,
    content: 'more coherent and elegant' },
  { rating: 5,
    game_id: game4.id,
    author_id: author3.id,
    content: 'rewarding experience' }
])
