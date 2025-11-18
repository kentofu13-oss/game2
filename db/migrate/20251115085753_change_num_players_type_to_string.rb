class ChangeNumPlayersTypeToString < ActiveRecord::Migration[6.1]
  def up
    change_column :mygames, :num_players, :string
  end

  def down
    change_column :mygames, :num_players, :integer
  end
end
