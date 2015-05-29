class Debate < ActiveRecord::Base

	# Definition: a list of posts around a topic


	belongs_to :topic, inverse_of: :posts
	has_many :debate_participations
	has_many :accounts, :through => :debate_participations
	has_many :posts
	has_one :timer, as: :timed
	
	
	# Below are defined some methods to make common database operations simpler
	
	scope :newest_first, lambda{order("debates.created_at DESC")}
	scope :search, lambda{|query|
		where(["name LIKE ?", "%#{query}%"])}


	# Below are some validations 

	#validates_presence_of :topic_id
	# validates_the_numericality_of :topic_id
	# validates_the_numericality_of :time_limit
	# validates_the_numericality_of :back_and_forth_limit
	# validates_the_numericality_of :character_limit


	# creates a new timer for the debate and start it
	# @param: duration - the duration of the debate in minutes 
	def start_debate 
		timer = self.build_timer
		if timer.save
			return timer.start_timer(this.time_limit)
	    else 
	    	raise "couldn't start timer"
	    end
	end

	# get which debater's turn it is (left or right)
	# @param: self
	# @return string indicating which side the next debater is

	def get_turn 

		if self.posts.empty?
			
			return "both"
		else
			current_side = DebateParticipation.find_by_account_id_and_debate_id(self.posts.last.account_id,self.id).side
			next_side = current_side == "left_side" ? "right_side" : "left_side"
			
			return next_side
		end
	end

	# get the participants of this debate
	# @return List<Account : a list containing two accounts representing the two participants of this debate
	def get_debaters
		return self.accounts
	end

	# get the left participant of this debate
	# @return Account: the account representing the left participant of this debate. nil if the debate has no left participants yet
	def get_left_debater
		return DebateParticipation.find_by_debate_id_and_side(self.id, "left_side").get_user
	end

	# get the right participant of this debate
	# @return Account: the account representing the right participant of this debate. nil if the debate has no right participants yet
	def get_right_debater
		return DebateParticipation.find_by_debate_id_and_side(self.id, "right_side").get_user
	end

	# find out if a debate is started or not
	# @return true if a debate is started. False otherwise 
	def started?
		return self.timer.status == "--running--"
	end



end
