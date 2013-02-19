require 'test_helper'

class ReminderMailerTest < ActionMailer::TestCase
  tests ReminderMailer

  test "should send email to from_email only" do
    reminder = Reminder.create(:from_name => 'Ben Gibbs', :from_email => 'ben@bobop.co.uk', :to_name => 'Tom Jeeps', :item => 'DVDs', :reminder_gap => '1m')

    # Send the email, then test that it got queued
    reminder.send!
    assert !ActionMailer::Base.deliveries.empty?
    email = ActionMailer::Base.deliveries.last
 
    # Test the body of the sent email contains what we expect it to
    assert_equal [reminder.from_email], email.to
    assert_equal "A quick reminder about your DVDs", email.subject
  end

  test "should send email to from_email and to_email" do
    reminder = Reminder.create(:from_name => 'Ben Gibbs', :from_email => 'ben@bobop.co.uk', :to_name => 'Tom Jeeps', :to_email => 'tom@bobop.co.uk', :item => 'DVDs', :reminder_gap => '1m')

    # Send the email, then test that it got queued
    reminder.send!
    assert !ActionMailer::Base.deliveries.empty?
    email = ActionMailer::Base.deliveries.last
 
    # Test the body of the sent email contains what we expect it to
    assert_equal [reminder.to_email], email.to
    assert_equal "A quick reminder about my DVDs", email.subject
  end
end
