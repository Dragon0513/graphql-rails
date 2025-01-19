class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.boolean :verified

      t.timestamps
    end
  end
end
