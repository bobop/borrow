class ReminderMailer < ActionMailer::Base
  # default from: "from@example.com"

  def reminder(reminder)
    @reminder = reminder
    mail(to: @reminder.to_email.present? ? @reminder.to_email : @reminder.from_email, from: @reminder.from_email, subject: "A quick reminder about my #{@reminder.item}") do |format|
      format.text
      format.html
    end
  end
end
