require 'chronic'

class Meeting
  include DataMapper::Resource

  def self.when
    "2nd Wednesday"
  end

  def self.time
    " 6:00PM"
  end

  def self.next
    this_month_meeting = Chronic.parse "#{self.when} of this month"
    next_month_meeting = Chronic.parse "#{self.when} of next month"
    this_month_meeting < Time.now ? next_month_meeting : this_month_meeting
  end
  # property <name>, <type>
  property :id, Serial
  property :topic, String
  property :description, String
  property :date, DateTime
end
