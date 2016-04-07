class User < ActiveRecord::Base
	has_many :events

	has_many :goings, foreign_key: :user_id  #:atendee_id #Does he add both foreign keys to the model?
	has_many :attended_events, through: :goings, source: :event
end
