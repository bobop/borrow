class Borrow < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  attr_accessible :borrower_email, :borrower_name, :reminder_date, :returned_date, :item_attributes, :item_id

  accepts_nested_attributes_for :item

  validates :borrower_name, :borrower_email, :reminder_date, presence: true

  scope :historic, where('returned_date IS NOT NULL')
end
