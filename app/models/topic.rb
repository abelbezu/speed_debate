class Topic < ActiveRecord::Base
	has_many :debates, :dependent => :destroy # Many debates can be created for a single topic if the topic is destroyed, then distroy the child debates 
	accepts_nested_attributes_for :debates, allow_destroy: true 

	has_one :debate_room
	has_one :story
	has_one :challenge
	belongs_to :account
	has_one :content, as: :content_owner
	scope :newest, lambda{select("MAX('created_at')")}
	scope :visible, lambda{where(visibility: 'visible')}
	scope :newest_first, lambda{order("topics.created_at DESC")}
	scope :search, lambda{|query|
		where(["topic_sentence LIKE ?", "%#{query}%"])}
	

	# topic submission validations
	# validates_presence_of :topic_sentence
	# validates_presence_of :account_id
	validates_presence_of :left_side_topic
	validates_length_of :left_side_topic, :within => 1..100
	# validates_presence_of :right_side_topic
	validates_length_of :topic_sentence, :within => 1..100
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

	def self.sort_for_home_page
		sorted_topics = []
		all_topics = Topic.visible
		all_topics.each do |topic|
			if topic.has_finished_debate
				sorted_topics << topic
			end

		end
		all_topics.each do |topic|
			unless sorted_topics.include? topic
				sorted_topics << topic
			end
		end
		return sorted_topics
	end
	
	def is_involved account
		return true
	end

	def has_finished_debate
		self.debates.each do |debate|
			if debate.is_over 5
				return true
			end

		end
		return false
	end

	#thsi functions should be ad
	def is_open
		return (self.challenge.status == "open")&&(!self.has_email_challengee)&&(!self.has_account_challengee)
	end

	def is_full
		return self.debates.first.full?
	end

	def has_account_challengee
		return (self.challenge != nil) && (self.challenge.challengee_id != nil) 
	end

	def has_email_challengee
		return (self.challenge != nil) && (self.challenge.challengee_email != nil) 
	end

	def display_user_prompt_for account
		if !((self.is_full) || (self.get_creator == account))
			if(self.is_open)
				return true

			elsif((self.has_account_challengee && (self.challenge.challengee_id == account.id))&& !(self.challenge.status == "refused") )
				return true

			elsif(self.has_email_challengee && (self.challenge.challengee_email == account.email))
				return true
			end 
			return false
		else 
			return false
		end
		return false
	end

	def display_challenge_refused_for account
		if !self.is_open && !self.is_full
			if ((self.get_creator == account)&&(self.challenge.challenger_id == account.id))
				return self.challenge.status == "refused"
			else
				return false
			end
		else
			return false
		end

	end
	
	def get_challengee
		return Account.find(self.challenge.challengee_id)

	end

	def has_user_waiting account
		return ((self.challenge != nil)&&(self.challenge.challenger_id == account.id)&& !(self.is_full))
	end




end
