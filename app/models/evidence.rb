class Evidence < ActiveRecord::Base
	belongs_to :post
	has_many :images, as: :image_owner
end
