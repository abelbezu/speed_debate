require 'rails_helper'
# Test timer model
# Partitions: Test timer validations, start, end
# 			 -Test start_timer, stop, pause, resume, get_status, get_position
RSpec.describe Timer, type: :model do
  
  it "validates the presence of start time" do 
  	#start time present
    d = DateTime.now
    timer = build(:timer, :start_time => d).should be_valid
    # start time not present
    timer = build(:timer, :start_time => '').should_not be_valid
  end 

  it "validates the presence of end time" do 
      #start time present
    d = DateTime.now + 7
    timer = build(:timer, :end_time => d).should be_valid
    # start time not present
    timer = build(:timer, :end_time => '').should_not be_valid


  end

  it "starts the timer the right way" do
    #build a timer and make sure it started
    timer = build(:timer)
    timer.start_timer(1440).should be true

    #check if debate holds the right duration
    timer.status.should eq("--running--")
    (timer.end_time - timer.start_time).should eq(1) 

  end

  it "stops the timer the right way" do 

    #build a timer and make sure it started
    timer = build(:timer)
    timer.start_timer(1440).should be true

    #check if debate holds the right duration
    timer.stop
    timer.get_status.should eq('--stopped--')

    expect{timer.stop}.to raise_error(RuntimeError)
  end

  it "pauses the timer the right way" do 
     #build a timer and make sure it started
    timer = build(:timer)
    timer.start_timer(1440).should be true

    #check if debate holds the right duration
    timer.pause
    timer.get_status.should eq('--paused--')

    
  end

  it "resumes a paused timer the right way" do
     #build a timer and make sure it started
    timer = build(:timer)
    timer.start_timer(1440).should be true

    #check if debate holds the right duration
    timer.pause
    timer.resume
    timer.get_status.should eq('--running--')
    expect{timer.resume}.to raise_error(RuntimeError)
  end 

 

  it "gets the position of the timer" do
    timer = build(:timer)
    timer.start_timer(1440).should be true

    #check if debate holds the right duration
    
    timer.get_status.should eq('--running--')
    expect(timer.get_position).to be_truthy 
  end

end
