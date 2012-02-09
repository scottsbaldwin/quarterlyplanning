class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name
      t.references :quarter

      t.timestamps
    end
    add_index :sprints, :quarter_id
  end
end
