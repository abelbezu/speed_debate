class DebateParticipation < ActiveRecord::Base
	belongs_to :account
	belongs_to :debate

	#deprecated
	def self.check_participation account_id, debate_id
		participation = self.find_by_account_id_and_debate_id(account_id, debate_id)
		if participation 
			return participation.role 
		else
			return "none"
			
		end
	end

	#fetch the account associated to this participation
	def get_user
		return Account.find(self.account_id)
	end

	#find out if 
	
	
end
