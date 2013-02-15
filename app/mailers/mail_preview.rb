class MailPreview < MailView

    def with_message
      reminder = Reminder.create!(from_email: 'ben@bobop.co.uk', from_name: 'Ben', to_email: 'toby@bobop.co.uk', to_name: 'Toby', reminder_gap: '1m', message: 'Here is a Message', item: 'Cordless Drill')
      mail = ReminderMailer.reminder(reminder)
      reminder.destroy
      mail
    end

    def without_message
      reminder = Reminder.create!(from_email: 'ben@bobop.co.uk', from_name: 'Ben', to_email: 'toby@bobop.co.uk', to_name: 'Toby', reminder_gap: '1m', item: 'Cordless Drill')
      mail = ReminderMailer.reminder(reminder)
      reminder.destroy
      mail
    end

  end