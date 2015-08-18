class Post < ActiveRecord::Base
	
	# a single argument stated by a user

	has_one :content, as: :content_owner
    has_many :comments

    accepts_nested_attributes_for :content, :reject_if => :all_blank, allow_destroy: true 

    validates_presence_of :content
    has_one :evidence
	belongs_to :debate
	belongs_to :account
	
	#define some methods to make life easier
	scope :newest_first, lambda{order("posts.created_at ASC")}
	scope :newest, lambda{where("posts.created_at MAX")}

	

	# get what debate this post belongs to
	# @return Debate debate owning this post
	def get_debate
		if self.debate_id == nil
			return nil
		end
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
	def is_first 
		return self == self.get_debate.posts.first
	end 

	#get the side of this post
	def get_side
		return DebateParticipation.find_by_account_id_and_debate_id(self.account_id, self.debate_id).side
	end 

	def get_jsonified_comments
		comments_list = []
		self.comments.each do |comment|
			comments_list << comment.jsonify
		end
		return {comments: comments_list}.jsonify
	end
	

end
