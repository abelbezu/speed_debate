require 'rails_helper'
#verify the functions of account and test its behaviours
#Test: - basic data entry and authentication
# 	   - validations: first_name, last_name, email, password length
#      - debate ownership, side in a debate, role in a debate
RSpec.describe Account, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "basic data entry and authentication" do
	  user = build(:account)
	  expect(user.first_name).to eq("Test_1")
	  expect(user.last_name).to eq("User")
	  expect(user.email).to eq("Test_1@toucan.com")
	  expect(user.authenticate(:email => 'Test_1@toucan.com', :password => "123456789"))

	  
  end


  it "validates the presence of first_name" do
  	#something that validates the presence of a first name
    user = build(:account, :first_name => "present")
    expect(user.first_name).to eq("present")
  	
    #something that doesnt contain first_name
    user = build(:account, :first_name => "").should_not be_valid
    

  	#Something that breaks some convension in a first name
    user = build(:account, :first_name => "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest").should_not be_valid
    

  end 

  it "validate the presence of last_name" do
  #something that validates the presence of a first name
    user = build(:account, :last_name => "present")
    expect(user.last_name).to eq("present")
    
    #something that doesnt contain first_name
    user = build(:account, :last_name => "").should_not be_valid
    #expect(user.save).to have(1).error_on(:last_name)

    #Something that breaks some convension in a first name
    user = build(:account, :last_name => "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest").should_not be_valid
    #expect(user.save).to have(1).error_on(:last_name)
  end

  it "validate the presence and uniqueness of email" do

    # check if a valid email is saved
    user = build(:account, :email => "testing_email@toucan.com")
    expect(user.email).to eq("testing_email@toucan.com")

    # Check email length validation
    create(:account, :email => "test@toucan.com").should be_valid
    user = build(:account, :email => "test@toucan.com").should_not be_valid
    #expect(user.last_name).to have(1).error_on(:email)
  end

  it "validates the length of email" do 
    user = build(:account, :email => "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest").should_not be_valid
    
  end

  it "validates the format of email" do 

    #email is properly formatted
    #....checked in previous tests 

    #email doesn't contain @
    user = build(:account, :email => "testing_email_toucan.com").should_not be_valid
    

    #email doesn't contain .domain at the end
    user = build(:account, :email => "testing_email@toucan_com").should_not be_valid
    

  end 


  it "validates the length of password" do
    # proper length of password
    user = build(:account, :password => "testing_email_toucan_com")
    expect(user.password).to eq("testing_email_toucan_com")
    # length of password less than 8
    user = build(:account, :password => "12346").should_not be_valid
    
    # length of password greater than 32
    user = build(:account, :password => "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest").should_not be_valid
    
  end

  it "gets the side of the debater" do
    # gets the right side when it is left
    debate = build(:debate)
    debate.save
    user = create(:account)
    debate.register_participant(user.id, "left")

    expect(user.get_side debate.id).to eq("left")

    
  end

  it "gets the debates the user is participating in" do 
    debate_1 = create(:debate)
    debate_2 = create(:debate)
    debate_3 = create(:debate)

    user = create(:account)

    # expect empty list if the user is not participating in any debates
    expect(user.get_debates).to be_empty 

    #if the user is registered to users, fetch them all
    debate_1.register_participant(user.id, "left")
    debate_2.register_participant(user.id, "right_side")
    debate_3.register_participant(user.id, "left_side")

    expect(user.get_debates).to eq([debate_1, debate_2, debate_3])

  end

  it "gets the role of the user in a debate" do 
     # gets the right side when it is left
    debate = build(:debate)
    debate.save
    user = create(:account)
    debate.register_participant(user.id, "left")

    expect(user.get_role debate.id).to eq("debater")

  end 

  it "generates a random unique key and stores it" do
    user = build(:account)
    expect(user.generate_channel_key).to be_truthy

    expect(user.get_channel_key).to be_truthy

  end


end
