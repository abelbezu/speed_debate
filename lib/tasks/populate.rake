# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rake db:populate"


namespace :db do
  desc "Erase and fill database"
  # 
  task :populate => :environment do
    require 'faker'
    # require "as-duration"

    Rake::Task['db:reset'].invoke
    Account.create!(
        :first_name => "John", #=> "Kaci"
        :last_name => "Smith",
        :email => "jsmith@test.org",
        :display_name => "JSmith",
        :password => "123456789",
        :privilege => "super")
    1.times do |a|
      test_admin_image = Image.create!(
        :image_owner_id => 1,
        :image_owner_type => "account",
        :url => "profile_default.phg",
        :image_use => "profile_pic")
    end
    # Create test_user account
    # 
    1.times do |a|
      test_user = Account.create!(
        :first_name => Faker::Name.first_name, #=> "Kaci"
        :last_name => Faker::Name.last_name,
        :email => "user_#{a}@toucan.org",
        :display_name => "test",
        :password => "password",
        :privilege => "user")
    1.times do |a|
      test_image = Image.create!(
        :image_owner_id => test_user.id,
        :image_owner_type => "account",
        :url => "profile_default.phg",
        :image_use => "profile_pic")
    end
      # Create test topics
      # 
      5.times do |top|
        test_topic = Topic.create!(
          :topic_sentence => Faker::Lorem.sentence,
          
          :description => Faker::Lorem.paragraph,
          :left_side_topic => Faker::Lorem.sentence(3),
          :right_side_topic => Faker::Lorem.sentence(3),
          :category => "default", 
          :account_id => test_user.id)
      
        
        # 
        5.times do |deb|
          test_debate = Debate.create!(
            :time_limit => 5,
            :character_limit => 500,
            :back_and_forth_limit => 8,
            :topic_id => test_topic.id)
            

          5.times do |post|

            test_post = Post.create!(
              :account_id => test_user.id,
              :debate_id => test_debate.id)
            1.times do |content|
              test_content = Content.create!(
              :content_owner_id => test_post.id,
              :content_owner_type => "post",
              :content_body => Faker::Lorem.paragraph) #todo: make paragraph length random
              end  
            end #post ends here
            # 1.times do |timer|
            #   start_time = DateTime.now
            #   test_timer = Timer.create!(
            #   :timed_id => test_post.id,
            #   :timed_type => "post",
            #   :start_time => start_time, #todo: randomize time, if possible
            #   :pos => start_time + 2, #todo:randomze 
            #   :end_time => start_time + 7) #todo: randomize

            #   end
          # 1.times do |timer|
          #   test_timer = Timer.create!(
          #   :timed_id => test_debate.id,
          #   :timed_type => "debate",
          #   :start_time => Faker::Time.between(2.days.ago, Time.now, :all), #todo: randomize time, if possible
          #   :pos => Faker::Time.forward(2, :all), #todo:randomze 
          #   :end_time => Faker::Time.forward(2, :all)) #todo: randomize

          #   end #debate timer ends here

        end #debate ends here
      end#topic ends here
    end#account ends here


end #the whole class ends here

end
