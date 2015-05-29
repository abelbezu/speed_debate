class Post < ActiveRecord::Base
	
	# a single argument stated by a user

	has_one :content, as: :content_owner
    has_many :comments

    accepts_nested_attributes_for :content, :reject_if => :all_blank, allow_destroy: true 



	belongs_to :debate
	belongs_to :account
	
	#define some methods to make life easier
	scope :newest_first, lambda{order("posts.created_at ASC")}
	scope :newest, lambda{where("posts.created_at MAX")}

	# find which debater's turn it is (left or right)
	# @param: int debate_id - the id of the debate
	# @return string indicating which side the next debater is

	def self.find_turn debate_id

		if Debate.find(debate_id).posts.empty?
			
			return "both"
		else
			current_side = DebateParticipation.find_by_account_id_and_debate_id(Debate.find(debate_id).posts.last.account_id, debate_id).side
			next_side = current_side == "left_side" ? "right_side" : "left_side"
			
			return next_side
		end
	end

	# get what debate this post belongs to
	# @return Debate debate owning this post
	def get_debate
		return Debate.find(self.debate_id)
	end

	# get which user (Account) this post was created by
	# @return Account that created this post
	def get_user
		return Account.find(self.account_id)
	end

	# get what topic this post belongs to
	# @return Topic topic of this post
	def get_topic
		return Topic.find(Debate.find(self.debate_id).topic_id)
	end
	# check if this post is the first post of the debate.
	# @return true if the post is the first one, else return false
	def is_first? 
		return self == self.get_debate.posts.first
	end 

end
