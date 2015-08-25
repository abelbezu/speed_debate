FactoryGirl.define do  factory :evidence do
    
  end
  factory :challenge do
    
  end
  factory :story do
    
  end
  factory :debate_room do
    
  end
  factory :relationship do
    
  end
  factory :account_detail, :class => 'AccountDetails' do
    
  end
  factory :report do
    
  end
  





  


  
  factory :comment do
    
  end
  factory :debate_participation do
    
  end
  
    


  
  #factory (builder) definition for account
  factory :account do
    sequence(:first_name) {|n| "Test_#{n}"}
    last_name "User"
    display_name "#{first_name}_test"
    email {"#{first_name}@toucan.com"}
    password "123456789"
    privilege "user"
  end


  #factory (builder) definition for topic, associations account
  factory :topic do
    #an owner account
    account

    # data attribites
    sequence(:topic_sentence) {|n| "test debate topic #{n}"}
    description "description for the test topic"
    left_side_topic "left side"
    right_side_topic "right side"
    category "default_category"


  end

  factory :debate, :aliases => [:timed]do
    #debater and topic 
    topic

    time_limit 20
    character_limit 20
    back_and_forth_limit 20
   
  end

  factory :post do
    #debater and topic 
    account
    debate
   
  end


 

  factory :timer do
    timed

    start_time = DateTime.now
    pos = start_time + 2
    end_time = start_time + 7
    
  end

  factory :content do 
    content_owner

    content_body  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eget felis in erat placerat lacinia. Nam ultricies lectus nec eleifend semper. Nunc interdum sagittis dui non egestas. Nunc quis justo molestie, vehicula ligula non, faucibus leo. Curabitur in augue dignissim, efficitur nibh consectetur, vestibulum velit. Integer sagittis lacus eu cursus finibus. Donec quis posuere leo. Nam posuere felis non elementum gravida. Ut volutpat magna sollicitudin leo auctor, tempus convallis urna ultrices."

  end


  factory :user_activity do
    account

    last_seen DateTime.now
    status  "online"
    update_status "expired"
    
  end

  


end