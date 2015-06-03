class Topic < ActiveRecord::Base
	has_many :debates, :dependent => :destroy # Many debates can be created for a single topic if the topic is destroyed, then distroy the child debates 
	accepts_nested_attributes_for :debates, :reject_if => :all_blank, allow_destroy: true 

	
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

	# unwanted validation. Look again
	validates_presence_of :description
	# returns the creator of this topic
	def get_creator
		return Account.find(self.account_id)
	end 


end
