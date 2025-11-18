class AddPlatformsToMygames < ActiveRecord::Migration[6.1]
  def change
    add_column :mygames, :platforms, :string
  end
end
