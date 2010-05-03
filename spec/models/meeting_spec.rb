require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Meeting Model" do

  before(:all) do
    date = Time.local(2010, 5, 1, 1, 0, 0)
    Timecop.freeze date
  end

  after(:all) do
    Timecop.return
  end  

  it 'can be created' do
    @meeting = Meeting.new
    @meeting.should_not be_nil
  end

  it 'can deterimine the date of the next meeting' do 
    Meeting.stubs(:when).returns("2nd Wednesday")
    Meeting.next.should == Time.local(2010, 5, 12, 12, 0, 0)
  end
end

