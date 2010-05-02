require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "MeetingsController" do
  before do
    get "/meetings"
  end

  it "returns hello world" do
    last_response.body.should include "Next Meeting"
  end
  describe "with upcoming meeting" do
    it "should display the next month's meeting" do
      
    end
  end
end
