class ReminderMailer < ActionMailer::Base
  # default from: "from@example.com"

  def remind_self(reminder)
    @reminder = reminder
    mail(to: @reminder.from_email, from: "no-reply@borrownote.com", subject: "A quick reminder about your #{@reminder.item}") do |format|
      format.text
      format.html
    end
  end

  def remind_them(reminder)
    @reminder = reminder
    mail(to: @reminder.to_email, from: @reminder.from_email, subject: "A quick reminder about my #{@reminder.item}") do |format|
      format.text
      format.html
    end
  end
end
