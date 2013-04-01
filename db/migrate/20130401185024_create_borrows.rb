class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.references :user
      t.references :item
      t.string :borrower_name
      t.string :borrower_email
      t.date :reminder_date
      t.date :returned_date

      t.timestamps
    end
    add_index :borrows, :user_id
    add_index :borrows, :item_id
  end
end
