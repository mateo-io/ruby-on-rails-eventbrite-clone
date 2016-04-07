module UsersHelper
	def current_user
		@user=User.find_by(id: session[:id])
	end

	def go_to(event)
		current_user.attended_events<<event unless event.atendees.where(id: current_user.id).any?
	end

	def dont_go(event)

end
