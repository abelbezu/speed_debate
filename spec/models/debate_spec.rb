require 'rails_helper'
# Test the debate model.
# Partitions: - Test validations: 
# 			  - Test start_debate, see if a timer is created, test if timer has a proper start value
# 			  - Test get_turn
#    		  - Test get_debaters
#             - Test get_left_debater, get_right_debater, started?
RSpec.describe Debate, type: :model do
  	
    it "creates debates" do

      debate = build(:debate)

    end
    it "gets left debater when there is one" do
      # no left debater
      debate = build(:debate)
      expect(debate.get_left_debater).to be_falsey

    end

    it "gets right debater when there is one" do
      debate = build(:debate)
      expect(debate.get_right_debater).to be_falsey

    end 
    it "registers participants" do
      #register right participant
      user = build(:account)
      user.save
      debate = build(:debate)
      debate.save

      debate.register_participant user.id, "right"
      expect(debate.get_right_debater).to eq(user)

      #register left participant
      user_2 = build(:account)
      user_2.save
      
      debate.register_participant user_2.id, "left"
      expect(debate.get_left_debater).to eq(user_2)

      #register right participant, where a participant already exists
      user_3 = build(:account)
      user_3.save
      
      expect{debate.register_participant user_3.id, "right"}.to raise_error(RuntimeError)
      
    end
  
    it "checks if the debate is full" do

      #debate is not full
       debate = build(:debate)
       debate.save
       expect(debate.full?).to eq(false)

       #debate is full
       user_left = build(:account)
       user_left.save
       user_right = build(:account)
       user_right.save
       debate.register_participant(user_left, "left")
       debate.register_participant(user_right, "right")

       expect(debate.full?).to eq(true)



    end
  
  	it "starts debate" do
      #doesn't start debate without full participants
      debate = build(:debate, :time_limit => 7*1440)
      debate.save        
      expect{debate.start_debate}.to raise_error(RuntimeError)
      expect(debate.started?).to eq(false)
      #starts the debate with full participation
      user_left = build(:account)
      user_left.save
      user_right = build(:account)
      user_right.save

      debate.register_participant(user_left, "left")
      debate.register_participant(user_right, "right")

      expect(debate.start_debate).to be_truthy
      expect(debate.timer).to be_truthy

      #checks if debate is started
      expect(debate.started?).to eq(true)

      #checks if the duration is right
      expect(debate.timer.end_time - debate.timer.start_time).to eq(7)

  	end


  	it "gets the right turn" do

      post_1 = create(:post)
      post_2 = create(:post)


  	end

  	it "gets two debaters" do 
      debate = create(:debate)
      user_1 = create(:account)
      user_2 = create(:account)
      user = create(:account)
      debate.register_participant(user_1.id, "left")
      debate.register_participant(user_2.id, "right")

      expect(debate.get_debaters).to eq([user_1, user_2])
  	end

  	it "gets one debater" do

  	end

  	

  	it "returns nil when there is left or right debater" do 

  	end

  	


end
