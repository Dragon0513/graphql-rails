class CreateGamesPlatformsJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :games, :platforms
  end
end
