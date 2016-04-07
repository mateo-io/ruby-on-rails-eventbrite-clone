module ApplicationHelper
	def current_user
		@user=User.find_by(id: session[:id])
	end

end
