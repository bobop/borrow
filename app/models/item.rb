class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :state, :description, :notes

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
