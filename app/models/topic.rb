class Topic < ActiveRecord::Base
	has_many :debates, :dependent => :destroy # Many debates can be created for a single topic if the topic is destroyed, then distroy the child debates 
	accepts_nested_attributes_for :debates, allow_destroy: true 

	
	belongs_to :account
	has_one :content, as: :content_owner
	scope :newest, lambda{select("MAX('created_at')")}
	scope :newest_first, lambda{order("topics.created_at DESC")}
	scope :search, lambda{|query|
		where(["topic_sentence LIKE ?", "%#{query}%"])}
	

	# topic submission validations
	validates_presence_of :topic_sentence
	validates_presence_of :account_id
	validates_presence_of :left_side_topic
	validates_presence_of :right_side_topic
	validates_length_of :topic_sentence, :within => 5..50
	# unwanted validation. Look again
	#validates_presence_of :description
	# returns the creator of this topic
	def get_creator
		return Account.find(self.account_id)
	end 

	#returns a list of debates under this topic in which a user is participating
	def get_user_involvment_number account_id
		count = 0
		self.debates.each do |debate|
			if debate.has_debater account_id
				count+=1
			end

		end
		return count

	end

	#returns a list of users on the given side of the topic
	def get_users_on_side side
		debates = []
		self.debates.each do |debate|
			puts debate.side_taken
			if debate.side_taken == side

				debates << debate
				debates
			end
		end 
		return debates
	end

	


end
