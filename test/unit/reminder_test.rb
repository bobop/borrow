require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  
  test "should not save Reminder without from_email" do
    reminder = Reminder.new(:from_name => 'Ben Gibbs', :to_name => 'Tom Jeeps', :item => 'DVDs', :reminder_gap => '1m')
    assert !reminder.save, "Saved the Reminder without from_email"
  end

  test "should not save Reminder without from_name" do
    reminder = Reminder.new(:from_email => 'ben@bobop.co.uk', :to_name => 'Tom Jeeps', :item => 'DVDs', :reminder_gap => '1m')
    assert !reminder.save, "Saved the Reminder without from_name"
  end

  test "should not save Reminder without to_name" do
    reminder = Reminder.new(:from_name => 'Ben Gibbs', :from_email => 'ben@bobop.co.uk', :item => 'DVDs', :reminder_gap => '1m')
    assert !reminder.save, "Saved the Reminder without to_name"
  end

  test "should not save Reminder without item" do
    reminder = Reminder.new(:from_name => 'Ben Gibbs', :from_email => 'ben@bobop.co.uk', :to_name => 'Tom Jeeps', :reminder_gap => '1m')
    assert !reminder.save, "Saved the Reminder without item"
  end

  test "should not save Reminder without reminder_gap" do
    reminder = Reminder.new(:from_name => 'Ben Gibbs', :from_email => 'ben@bobop.co.uk', :to_name => 'Tom Jeeps', :item => 'DVDs')
    assert !reminder.save, "Saved the Reminder without reminder_gap"
  end

  test "should not save Reminder with bad from_email" do
    reminder = Reminder.new(:from_name => 'Ben Gibbs', :from_email => 'myemailaddress', :to_name => 'Tom Jeeps', :item => 'DVDs', :reminder_gap => '1m')
    assert !reminder.save, "Saved the Reminder with bad from_email"
  end

  test "should not save Reminder with bad to_email" do
    reminder = Reminder.new(:from_name => 'Ben Gibbs', :from_email => 'ben@bobop.co.uk', :to_name => 'Tom Jeeps', :item => 'DVDs', :reminder_gap => '1m', :to_email => 'email_address.com')
    assert !reminder.save, "Saved the Reminder bad to_email"
  end

  test "should save Reminder successfully" do
    reminder = Reminder.new(:from_name => 'Ben Gibbs', :from_email => 'ben@bobop.co.uk', :to_name => 'Tom Jeeps', :item => 'DVDs', :reminder_gap => '1m')
    assert reminder.save, "Did not Save the Reminder successfully"
  end

  test "should set reminder_date 1 month from now" do
    reminder = Reminder.new(:from_name => 'Ben Gibbs', :from_email => 'ben@bobop.co.uk', :to_name => 'Tom Jeeps', :item => 'DVDs', :reminder_gap => '1m')
    assert reminder.save, "Did not Save the Reminder successfully"
    assert_equal reminder.reminder_date, Date.today.advance(:months => 1)
  end



end
