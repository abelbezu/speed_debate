require 'rails_helper'
# Tests the post model
# Partitions: Test validations
# 			 - Test get_debate, get_user, get_topic and is_first?
#
RSpec.describe Post, type: :model do
  
  it "gets the right debate" do
    #check if the post gets a debate
    post_1 = build(:post)
    expect(post_1.get_debate).to be_truthy 

    #check if the post gets the right debate
    debate = build(:debate)
    debate.save
    post = debate.posts.build

    expect(post.get_debate).to eq(debate)
  	
  end 

  it "gets the right user" do
    #check if the post gets a debate
    post_1 = build(:post)
    expect(post_1.get_user).to be_truthy 

    #check if the post gets the right debate
    user = build(:account)
    user.save
    post = user.posts.build

    expect(post.get_user).to eq(user)

  end

  it "gets the right topic" do
    #check if the post gets a debate
    post_1 = build(:post)
    expect(post_1.get_topic).to be_truthy 

    #check if the post gets the right debate
    topic = build(:topic)
    topic.save
    debate = topic.debates.build
    debate.save
    post = debate.posts.build
    post.save

    expect(post.get_topic).to eq(topic)

  end 

  it "returns true when the post is first" do 

    debate = build(:debate)
    debate.save
    post = debate.posts.build
    post.save

    expect(post.is_first).to eq(true)
  end

  it "returns false when the post is not first" do 
    #returns true if the post is first
    debate = build(:debate)
    debate.save
    post = debate.posts.build
    post.save

    expect(post.is_first).to eq(true)

    #returns false if the post is not first
    second_post = debate.posts.build
    second_post.save
    expect(second_post.is_first).to eq(false)

  end  




end
