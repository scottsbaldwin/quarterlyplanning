class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :name
      t.integer :priority
      t.references :quarter

      t.timestamps
    end
    add_index :initiatives, :quarter_id
  end
end
