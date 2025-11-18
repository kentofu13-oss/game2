class ChangeNumPlayersToString < ActiveRecord::Migration[6.1]
  def change
    change_column :mygames, :num_players, :string
  end
end
