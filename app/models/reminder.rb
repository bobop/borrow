class Reminder < ActiveRecord::Base
  attr_accessible :from_email, :from_name, :item, :message, :reminder_date, :to_email, :to_name
end
