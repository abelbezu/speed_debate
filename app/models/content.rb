class Content < ActiveRecord::Base
	belongs_to :content_owner, polymorphic: true 
	has_many :images, as: :image_owner

	# Below are defined some methods to make common database operations simpler

	scope :comment, lambda{where(:type => "comment")} #returns a comment
	scope :post, lambda{where(:type => "post")} # returns a post
 	validates_presence_of :content_body
 	validates_length_of :content_body, :within => 1..750
	# a method to organize comments may be needed


	scope :sorted, lambda{order("contents.id ASC")}
	scope :most_popular , lambda{order("contents.likes DESC")}
	scope :newest_first, lambda{order("contents.created_at DESC")}
	
end
