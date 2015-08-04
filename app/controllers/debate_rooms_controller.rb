class DebateRoomsController < ApplicationController
	layout false
	def index
	end

	def show
	end

	def new
	end

	def create
		debate_room  = DebateRoom.new(:topic_id => params[:topic_id], :video_url => params[:video_url])
		if debate_room.save

		else
			
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
