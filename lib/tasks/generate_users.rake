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

    #Rake::Task['db:reset'].invoke
    
    # 
    10.times do |a|
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
          :url => "profile_default.png",
          :image_use => "profile_pic")
      end
    end
  end
end
