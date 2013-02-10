class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :from_name
      t.string :from_email
      t.string :to_name
      t.string :to_email
      t.string :item
      t.date :reminder_date
      t.text :message

      t.timestamps
    end
  end
end
