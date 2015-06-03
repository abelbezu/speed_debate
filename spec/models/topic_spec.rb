require 'rails_helper'
# tests for topic.
# Test:  - validations topic sentence, description, left_side,right_side

RSpec.describe Topic, type: :model do
  
  it "validates the presence of topic_sentence" do 
  	#topic_sentence present
  	topic = build(:topic, :topic_sentence => "test topic")
  	topic.topic_sentence.should eq("test topic")
  	#topic.account_id.should exist
  	#topic_sentence not present
  	topic = build(:topic, :topic_sentence => "").should_not be_valid

  end

  it "validates the presence of description" do
  	#topic_sentence present
  	topic = build(:topic, :description => "test description").should be_valid
  	
  	#topic_sentence not present
  	topic = build(:topic, :description => "").should_not be_valid
  end

  it "validates the presnece of left_side" do
  	#topic_sentence present
  	topic = build(:topic, :left_side_topic => "test description").should be_valid
  	
  	#topic_sentence not present
  	topic = build(:topic, :left_side_topic => "").should_not be_valid
  end

  it "validates the presence of right_side" do 
  	#topic_sentence present
  	topic = build(:topic, :right_side_topic => "test description").should be_valid
  	
  	#topic_sentence not present
  	topic = build(:topic, :right_side_topic => "").should_not be_valid
  end 


end
