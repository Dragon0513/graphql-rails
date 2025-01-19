class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.belongs_to :game, null: false, foreign_key: true
      t.belongs_to :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
