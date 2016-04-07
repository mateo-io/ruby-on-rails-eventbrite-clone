class User < ActiveRecord::Base
	has_many :events, dependent: :destroy  #This is for the creator reference

	has_many :goings, foreign_key: :user_id  #Tell goings where to look for
	has_many :attended_events, through: :goings, source: :event #Get goings-event, attended_events is an alias

	def upcoming_events
		attended_events.where(:date < Date.today)
	end

	def previus_events
	end
end
