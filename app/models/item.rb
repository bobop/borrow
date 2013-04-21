class Item < ActiveRecord::Base
  belongs_to :user
  has_many :borrows
  has_one :current_borrow, :class_name => 'Borrow', :conditions => "returned_date IS NULL"
  attr_accessible :name, :state, :description, :notes, :borrows_attributes

  accepts_nested_attributes_for :borrows

  validates :name, :state, presence: true

  state_machine :state, :initial => :in do
    state :out

    event :borrowed do
      transition :from => :in, :to => :out
    end
    event :returned do
      transition from: :out, to: :in
    end
  end
end
