class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(params[:reminder])
    if @reminder.save
      ReminderMailer.remind_self(@reminder).deliver if Rails.env.development?
      redirect_to root_url, notice: 'Reminder stored successfully to send later'
    else
      render :new
    end
  end
end
