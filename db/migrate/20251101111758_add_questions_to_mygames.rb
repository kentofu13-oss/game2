class AddQuestionsToMygames < ActiveRecord::Migration[7.2]
  def change
    add_column :mygames, :question1, :string
    add_column :mygames, :question2, :string
    add_column :mygames, :question3, :string
    add_column :mygames, :question4, :string
  end
end
