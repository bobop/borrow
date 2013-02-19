class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(params[:reminder])
    if @reminder.save
      ReminderMailer.remind_self(@reminder).deliver if Rails.env.development?
      text = '1 week' if @reminder.reminder_gap == '1w'
      text = '1 month' if @reminder.reminder_gap == '1m'
      text = '2 months' if @reminder.reminder_gap == '2m'
      text = '3 months' if @reminder.reminder_gap == '3m'
      text = '6 months' if @reminder.reminder_gap == '6m'
      text = '1 year' if @reminder.reminder_gap == '1y'
      notice = "Great! Your reminder will be sent in #{text}."
      notice = "Great! Your reminders will be sent in #{text}." if @reminder.to_email.present?
      redirect_to root_url, notice: notice
    else
      render :new
    end
  end
end
