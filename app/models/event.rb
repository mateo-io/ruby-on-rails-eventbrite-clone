class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  
  has_many :goings, foreign_key: :event_id #Tell goings where to look for
  has_many :atendees, through: :goings, source: :user #Get goings-user, atendees is only used for Self

  has_many :invitees, through: :invitations, source: :user
  has_many :invitations, foreign_key: :event_id

  default_scope -> {order(date: :asc)}

/
  def Event.past
  	self.all.where("date <:today",{today: Date.today})
  end

  def Event.future
  	Event.all.where("date >:today",{today: Date.today})
  end
/
  scope :past, -> {where("date <:today",{today: Date.today})}
  scope :future, -> {where("date >:today",{today: Date.today})}
end
