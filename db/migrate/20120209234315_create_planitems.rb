class CreatePlanitems < ActiveRecord::Migration
  def change
    create_table :planitems do |t|
      t.references :team
      t.references :initiative
      t.references :sprint
      t.string :description
      t.string :itemtype
      t.boolean :committed
      t.text :notes

      t.timestamps
    end
    add_index :planitems, :team_id
    add_index :planitems, :initiative_id
    add_index :planitems, :sprint_id
  end
end
