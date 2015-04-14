class Account < ActiveRecord::Base
	has_many :topics #refers to the topics the user creates 
	has_many :debate_participations # refers to the user's participation in debates
	has_many :comments # A user will create many contents
	has_many :posts
	has_many :debates, :through => :debate_participations
	has_secure_password
	has_many :images, as: :image_owner




	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates_presence_of :first_name
	validates_length_of :first_name, :within => 1..50
	validates_presence_of :last_name
	validates_length_of :last_name, :within => 1..50
	

    validates :email, :presence => true,
				  :length => {:within => 3..50},
				  :uniqueness => true,
				  :format => {:with => EMAIL_REGEX}


	validates :password, :presence => true,
						 :confirmation => true,
						 :length => {:within => 8..32}

	
	scope :search, lambda{|query|
		where(["first_name LIKE ?", "%#{query}%"])}


	

	def self.from_omniauth(auth)
	  where(provider: auth.provider).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.first_name = auth.info.first_name
	    user.last_name = auth.info.last_name
	    user.email = auth.info.email
	    user.display_name = auth.info.first_name
	    user.images.first_or_initialize(:url => auth.info.image, :image_use => 'profile_pic')
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.password = "$2a$10$oT656dk9lBHet1/t0dl3XOD"
	    user.save!
	  end
	end



	


end
