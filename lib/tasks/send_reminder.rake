desc "This task sends the reminder emails"
task :send_reminders => :environment do
  Reminder.where(:reminder_date => Date.today).all.each do |r|
    ReminderMailer.delay.reminder(r)
  end
end