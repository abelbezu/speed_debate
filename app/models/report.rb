class Report < ActiveRecord::Base
	validates_presence_of :issue
	validates_presence_of :page
end
