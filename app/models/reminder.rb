class Reminder < ActiveRecord::Base
  attr_accessible :from_email, :from_name, :item, :message, :reminder_date, :to_email, :to_name, :reminder_gap
  attr_accessor :reminder_gap

  before_create :format_reminder_date

  validates :from_email, :from_name, :item, :message, :to_email, :to_name, :reminder_gap, :presence => true

  private

  def format_reminder_date
    case reminder_gap
      when '1w'
        self.reminder_date = Date.today.advance(weeks: 1)
      when '1m'
        self.reminder_date = Date.today.advance(months: 1)
      when '2m'
        self.reminder_date = Date.today.advance(months: 2)
      when '3m'
        self.reminder_date = Date.today.advance(months: 3)
      when '6m'
        self.reminder_date = Date.today.advance(months: 6)
      when '1y'
        self.reminder_date = Date.today.advance(years: 1)
    end
    logger.info "--- Date.today = #{Date.today}"
    logger.info "--- self.reminder_date = #{self.reminder_date}"
  end

end
