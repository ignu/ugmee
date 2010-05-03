require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "MeetingsController" do
  before do
    get "/meetings"
  end

  it "returns hello world" do
    last_response.body.should include "Next Meeting"
  end

  describe "with upcoming meeting" do
    before(:each) do
      Timecop.freeze Time.local(2010, 5, 2)
      @meeting = Meeting.new :topic=> "Autobot Reunion", :description="Cool Times", :date=>Chronic.parse("Next Wednesday")

    end

    it "should display the next month's meeting" do
      last_response.body.should include "Autobot Reunion"
    end
  end
end
