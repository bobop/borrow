desc "This task sends the reminder emails"
task :send_reminders => :environment do
  Reminder.to_send.each(&:send!)
end