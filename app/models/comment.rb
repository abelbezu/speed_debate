class Comment < ActiveRecord::Base
	has_one :content, as: :content_owner, :dependent => :destroy
	belongs_to :account

	accepts_nested_attributes_for :content, :reject_if => :all_blank, allow_destroy: true 

	has_many :replies, class_name: "Comment",
                          foreign_key: "main_comment_id"
 
  	belongs_to :main_comment, class_name: "Comment"


  	def self.linearize input_tree_root
		linearized = [input_tree_root]
		if input_tree_root.replies.empty?
			return linearized
		else
			input_tree_root.replies.each do |reply|
				linearize(reply).each do |linearized_reply|
					linearized.push(linearized_reply)
				end
			end
		end
		
		return linearized
   end

   def self.extract_replies input_list
   		return input_list[1..-1]
   end 

   def self.fetch_comments input_comment

   		return self.extract_replies(self.linearize(input_comment))

   end 

end
