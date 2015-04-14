class Debate < ActiveRecord::Base
	belongs_to :topic, inverse_of: :posts
	has_many :debate_participations
	has_many :accounts, :through => :debate_participations
	has_many :posts
	
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


end
