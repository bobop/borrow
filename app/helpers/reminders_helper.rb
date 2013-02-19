module RemindersHelper
  def selected_reminder_gap(reminder)
    text = 'Send in 1 week' if reminder.reminder_gap == '1w'
    text = 'Send in 1 month' if reminder.reminder_gap == '1m'
    text = 'Send in 2 months' if reminder.reminder_gap == '2m'
    text = 'Send in 3 months' if reminder.reminder_gap == '3m'
    text = 'Send in 6 months' if reminder.reminder_gap == '6m'
    text = 'Send in 1 year' if reminder.reminder_gap == '1y'
    return text
  end
end
