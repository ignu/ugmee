class Meeting
  include DataMapper::Resource

  def self.when
    "2nd Wednesday"
  end

  def self.next
    ''
  end
  # property <name>, <type>
  property :id, Serial
  property :topic, String
  property :description, String
  property :date, DateTime
end
