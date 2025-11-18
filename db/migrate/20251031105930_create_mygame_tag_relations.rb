class CreateMygameTagRelations < ActiveRecord::Migration[7.2]
  def change
    create_table :mygame_tag_relations do |t|
      t.references :mygame, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
