class Going < ActiveRecord::Base
	#belongs_to :atendee, class_name: "User"
	
	belongs_to :user
	belongs_to :event
end
