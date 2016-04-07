class Going < ActiveRecord::Base
	#belongs_to :atendee, class_name: "User"
	
	belongs_to :user, class_name: "User"
	belongs_to :event, class_name: "Event"
end
