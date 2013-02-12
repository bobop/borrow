class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(params[:reminder])
    if @reminder.save
      redirect_to root_url, notice: 'Reminder stored to send later'
    else
      render :new
    end
  end
end
