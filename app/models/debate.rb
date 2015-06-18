class Debate < ActiveRecord::Base

	# Definition: a list of posts around a topic


	belongs_to :topic
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


	# creates a new timer for the debate and start it. Doesn't start the debate unless debate if full
	# @param: duration - the duration of the debate in minutes 
	def start_debate 
		unless self.full? 
			raise "Debate doesn't have enough participants. \nNumber of participants: "+ self.debate_participations.count.to_s  
		end
		timer = self.build_timer
		if timer.save
			return timer.start_timer(self.time_limit)
	    else 
	    	raise "couldn't start timer"
	    end
	end

	# get which debater's turn it is (left or right)
	# @param: self
	# @return string indicating which side the next debater is

	def get_turn 
		unless self.full?
			raise "Debate doesn't have enough participants. \nNumber of participants: "+ self.debate_participations.count.to_S  
		end
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
		debate_participation = DebateParticipation.find_by_debate_id_and_side(self.id, "left_side")
		if debate_participation == nil
			return nil
		else
			return debate_participation.get_user
		end
	end

	# get the right participant of this debate
	# @return Account: the account representing the right participant of this debate. nil if the debate has no right participants yet
	def get_right_debater
		debate_participation = DebateParticipation.find_by_debate_id_and_side(self.id, "right_side")
		if debate_participation == nil
			return nil
		else
			return debate_participation.get_user
		end
	end

	#check if the debate has enough (2 for now) participants
	#@return: true if the debate has 2 participants, false otherwise
	def full?
		return self.debate_participations.count == 2
	end
	# find out if a debate is started or not
	# @return true if a debate is started. False otherwise 
	def started?
		if self.timer == nil
			return false
		end
		return self.timer.status == "--running--"
	end


	# Register a user on one of the sides of the debate. If the debate if full or the side is already taked, raise an exception
	# @param: account_id, the id of the user to register
	# @param: side, the side to register the user on
	# @return: true if user successfully registered, false if not, and raises exceptions if the debate is full or side is taken
	def register_participant account_id, side
		if self.full?
			raise "Debate already full"
		elsif side == "left" or side == "left_side"
			proper_side = "left_side"
			if self.get_left_debater != nil
				raise "Side already taken"
		    elsif (self.get_debaters.count ==1 && self.get_right_debater.id == account_id)
			    raise "Account already registered"
			end 
		elsif side == "right" or side == "right_side"
			proper_side = "right_side"
			if self.get_right_debater != nil
				raise "Side already taken"
			elsif (self.get_debaters.count ==1 && self.get_left_debater.id == account_id)
				raise "Account already registered"
			end 
			
		end
		
		debate_participation = DebateParticipation.new
		debate_participation.account_id = account_id
		debate_participation.debate_id = self.id
		debate_participation.side = proper_side
		debate_participation.role = "debater"
		if debate_participation.save
			return true
		else
			return false
		end
		
	end

	def side_taken
		if self.full?
			return "both"
		elsif self.get_debaters.count == 0
			return "none"
		else
			return self.get_debaters.first.get_side(self.id)

		end 
	end
	def side_free
		if self.full?
			return "none"
		elsif self.get_debaters.count == 0
			return "both"
		else
			return self.get_debaters.first.get_side(self.id) == "left_side"? "right_side": "left_side"

		end 
	end
	def get_left
		return Topic.find(self.topic_id).left_side_topic	
	end
	def get_right
		return Topic.find(self.topic_id).right_side_topic
	end 

	def join_free_side account_id
		if self.get_debaters.count == 1
			return self.register_participant(account_id, self.side_free)
		end
	end

	def has_debater account_id
		return ((self.get_left_debater == Account.find(account_id)) || (self.get_right_debater == Account.find(account_id)))
	end

	def get_topic
		return Topic.find(self.topic_id)
	end

	def get_opposite_user user
		unless self.get_debaters.count == 2
			return "none"
		else 
			self.get_debaters.each do |debater|
				if debater != user
					return debater
				end
			end
		end
		return "none"

	end


end
 