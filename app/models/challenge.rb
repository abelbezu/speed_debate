class Challenge < ActiveRecord::Base
	belongs_to :topic

	validates_presence_of :challenger_id
	#validates_presence_of :challengee_id

	#returns the account that sent the challenge
	def get_challenger
		return Account.find(self.challenger_id)
	end

	#returns the account that was challenged
	def get_challengee
		return Account.find(self.challengee_id)
	end

	#registers a challenge 
	
end
