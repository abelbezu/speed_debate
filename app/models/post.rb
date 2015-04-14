class Post < ActiveRecord::Base
	
	has_one :content, as: :content_owner
    has_many :comments

    accepts_nested_attributes_for :content, :reject_if => :all_blank, allow_destroy: true 



	belongs_to :debate
	belongs_to :account
	
	#define some methods to make life easier
	scope :newest_first, lambda{order("posts.created_at ASC")}
	scope :newest, lambda{where("posts.created_at MAX")}

	def self.find_turn debate_id

		if Debate.find(debate_id).posts.empty?
			
			return "both"
		else
			current_side = DebateParticipation.find_by_account_id_and_debate_id(Debate.find(debate_id).posts.last.account_id, debate_id).side
			next_side = current_side == "left_side" ? "right_side" : "left_side"
			
			return next_side
		end
	end
end
