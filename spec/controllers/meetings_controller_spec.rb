require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "MeetingsController" do
  describe "with no upcoming meeting" do 
    before(:each) do
      Meeting.all.each{|m| m.destroy!}
      get "/meetings"
    end

    it "should display a TBD message" do 
      last_response.body.should include "Topic: TBD"
      last_response.body.should include "Next Meeting"
    end
  end
  describe "with upcoming meeting" do
    before(:each) do
      Timecop.freeze Time.local(2010, 5, 2)
      @meeting = Meeting.new :topic=> "Autobot Reunion", :description=>"Cool Times", 
        :date=>Time.local(2010, 5, 12)
      @meeting.save!
      get "/meetings"

    end

    it "should display the next month's meeting" do
      last_response.body.should include "Autobot Reunion"
    end
  end
end
