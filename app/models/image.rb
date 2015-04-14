class Image < ActiveRecord::Base
	belongs_to :image_owner, polymorphic: true 



	scope :profile_pic, lambda{where(:image_use => 'profile_pic')}
end
