class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user
      t.string :name
      t.string :description
      t.text :notes
      t.string :state

      t.timestamps
    end
    add_index :items, :user_id
  end
end
