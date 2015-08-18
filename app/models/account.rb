class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
	include OnlineStatus


	#definition: a user
	before_create :generate_channel_key
	has_one :account_details, dependent: :destroy
	

	has_many :topics #refers to the topics the user creates 
	has_many :debate_participations # refers to the user's participation in debates
	has_many :debates, :through => :debate_participations


	has_many :comments # A user will create many contents
	has_many :posts
	has_many :images, as: :image_owner
	has_one  :user_activity
	has_many :notifications, :dependent => :destroy

	# stuff about followers and following
	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id",
                                  dependent: :destroy

    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy



    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

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

	
	# scope :search, lambda{|query|
	# 	where(["first_name LIKE ?", "%#{query}%"])}

    
	# Creates a new user from an omniauth token
	# @param JSON auth - omniauth token


	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
	    user.provider = auth.provider
	    user.first_name = auth.info.first_name
	    user.last_name = auth.info.last_name
	    user.email = auth.info.email
	    user.uid = auth.uid
	    user.display_name = auth.info.first_name
	    user.images.first_or_initialize(:url => auth.info.image, :image_use => 'profile_pic')
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.password = "$2a$10$oT656dk9lBHet1/t0dl3XOD"
	    user.skip_confirmation! 
	    user.save!
	  end
	end
	
	


	# returns a facebook handle for this user Used to perform some open graph operations
	# @return Koala object facebook
	def facebook
		@facebook ||= Koala::Facebook::API.new(oauth_token)

	end

	# find out what the side of this user in a given debate is
	# @param Int debate_id : the id of a debate
	# @return string side : the side of the user in the given debate
	def get_side debate_id
		role = self.get_role debate_id
		if( role == "debater")
			return DebateParticipation.find_by_account_id_and_debate_id(self.id, debate_id).side
		end
		return "none"
	end 


	# find out what the role of this user in a given debate is
	# @param Int debate_id : the id of a debate
	# @return string role: the role of the user in the given debate
	def get_role debate_id
		participation = DebateParticipation.find_by_account_id_and_debate_id(self.id, debate_id)
		return participation == nil ? "none" : participation.role
	end 


	# fetches a list of debates the user is participating in
	# @return List<Debate> debates : list of debates the user is participating in 
	def get_debates
		return self.debates
	end

	# registers user as a participant of a given debate
	# @param debate_id, the id of debate to participate in
	# @param side, which side to participate in
	# @return: true if user successfully registered
	def participate_in debate_id, side


	end
	#generates a random unique key for user and store it to channel key for 
	def generate_channel_key
		begin
	      key = SecureRandom.urlsafe_base64
	    end while Account.where(:channel_key => key).exists?
	    self.channel_key = key
	end

	def get_channel_key
		return self.channel_key
	end

	
	# methods for getting a list of users that are online
	def self.online_users
		online_users = []
		Account.all.each do |x|
			if x.online?
				online_users<<x
			end
		end
	end 

	def online?
		return false
	end

	def self.cache_all_users_to_redis
		
		Account.all.each do |x|
			return $redis.hset('users', x.id, "offline")
		end
	end

	def is_tester
		return (self.privilege =="super" || self.privilege =="admin" )|| self.privilege == "tester" 
	end

	def make_tester
		user = self
		return user.update_attribute(:privilege,"tester")
		
	end 
	
	def get_unread_notifications 
		return self.notifications.unread
	end

	def is_in_debate debate_id
		return Debate.find(debate_id).has_debater self.id
	end
	def is_in_topic topic_id
		involvment = Topic.find(topic_id).get_user_involvment_number self.id 
		return (involvment > 0)
	end
	
	def get_first_four_unread_notifications
		return self.notifications.newest_first[0..3]
	end

	 
	def self.new_with_session(params, session)
		if session["devise.account_attributes"]
			new(session["devise.account_attributes"], without_protection: true) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end

	end

	def store_in_redis
		user_data = {
						'first_name' => self.first_name, 
						'last_name' => self.last_name,
						'display_name' => self.display_name,
						'status' => 'offline',
					}
		
		$redis.hset('online_users', self.id, user_data.to_json)
	end

	#follow a user
	def follow(other_user)
    	active_relationships.create(followed_id: other_user.id, followed_type: "account")
  	end

  	#Stop following a user
  	def unfollow(other_user)
    	active_relationships.find_by(followed_id: other_user.id).destroy
  	end

  	def following?(other_user)
  		return self.following.include?(other_user)
  	end

  	def followed_by?(other_user)
  		return self.followers.include?(other_user)
  	end

  	def get_occupation 
  	    return self.account_details.occupation
  	end

  	def set_occupation (occupation)
  		return self.update_attribute("occupation", occupation)

  	end

  	def get_self_description
  		return self.account_details.description
  	end

end
