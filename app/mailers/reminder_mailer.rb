class ReminderMailer < ActionMailer::Base
  default from: "from@example.com"

  def reminder(reminder)
    @reminder = reminder
    mail to: @reminder.to_email, subject: "A quick reminder about my #{@reminder.item}"
  end
end
