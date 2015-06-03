class Timer < ActiveRecord::Base

	# definition: Is a time keeping database record.
	# Abstraction: {starttime, endtime, position, status} -> timer 
	# Invariant: start and end time of a specific instance shouldn't change during its life time
	# Owned by timed object	

	belongs_to :timed, polymorphic: true 
	validates_presence_of :start_time
	validates_presence_of :end_time

	# Starts the timer. Creates a new timer with a start time set to the current datetime, and 
	# the end time 'duration' minutes away 
	# to the end time provided.
	# @param: duration - a duration of the debate in minutes
	# @return: true if a timer is successfully started: instantiated with the needed values and 
	# saved successfully, else returns false

	def start_timer duration
		self.start_time = DateTime.now
		self.end_time = self.start_time + Rational(duration, 1440)
		self.status = "--running--"
		self.pos = self.start_time

		if self.save
			return true
		end

		return false
	
	end
	
	# Stops the timer. The timer will expire (regardless of exeeding the end time)
	# sets the position to the current time and the status to stopped.
	# raises a runtimer is already expired.
	# @return: true if the timer is successfully stopped else returns false.
	
	def stop
		if self.status == "--stopped--"
			raise "timer has already expired.\ntimer_status: " + self.status  
		end
		self.pos = DateTime.now
		self.status = "--stopped--"
		if self.save
			return true
		end

		return false
	end

	# Pauses the timer. Sets the position of the timer to the current time and the status to 
	# paused
	# raises a runtime error if the timer is already expired
	# @ return: true if the timer is successfully paused else returns false.
	def pause
		if self.status == "--stopped--"
			raise "timer has already expired.\ntimer_status: " + self.status 
		end
		self.pos = DateTime.now
		self.status = "--paused--"

		if self.save
			return true
		end
		return false
	end
	# Resumes the timer. Sets the status to running
	# raises a runtime error if the timer's status is not paused
	# @ return: true if the timer is successfully resumed else returns false.
	def resume
		unless self.status == "--paused--"
			raise "timer is not paused. \ntimer_status: " + self.status 
		end
		self.pos = DateTime.now
		self.status = "--running--"

		if self.save
			return true
		end
		return false
	end

	# @return: a string representing the status of this timer instance.
	def get_status
		return self.status
	end 

	# @return: a datetime representing the position of this timer instance.
	def get_position
		return self.pos
	end




end
