class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "Account"
  	belongs_to :followed, class_name: "Account"
	belongs_to :category_follower, class_name: "Account" 
	belongs_to :category_followed, class_name: "Category"

  	validates :follower_id, presence: true
  	validates :followed_id, presence: true
end
