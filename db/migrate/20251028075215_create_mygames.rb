class CreateMygames < ActiveRecord::Migration[7.2]
  def change
    create_table :mygames do |t|
      t.string :title
      t.string :genre
      t.string :platform
      t.integer :price
      t.integer :num_players

      t.timestamps
    end
  end
end
