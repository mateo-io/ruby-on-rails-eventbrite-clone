class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  
  has_many :goings, foreign_key: :event_id #Tell goings where to look for
  has_many :atendees, through: :goings, source: :user #Get goings-user, atendees is only used for Self

  default_scope -> {order(date: :asc)}


end
