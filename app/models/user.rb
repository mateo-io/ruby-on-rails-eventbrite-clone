class User < ActiveRecord::Base
	has_many :events, dependent: :destroy  #This is for the creator reference

	has_many :goings, foreign_key: :user_id  #Tell goings where to look for
	has_many :attended_events, through: :goings, source: :event #Get goings-event, attended_events is an alias

	has_many :invitations, foreign_key: :user_id
	has_many :invited_events, through: :invitations, source: :event

	def upcoming_events
		attended_events.where("date > :today",{today: Date.today})
	end

	def previous_events
		attended_events.where("date < :today",{today: Date.today})
	end


end
