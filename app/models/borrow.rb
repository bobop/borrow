class Borrow < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  attr_accessible :borrower_email, :borrower_name, :reminder_date, :returned_date
end
