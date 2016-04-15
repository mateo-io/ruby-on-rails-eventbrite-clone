class PagesController < ApplicationController
	include ApplicationHelper
	#Signup
	def signup
		session.clear
	end

	#Log in
	def create
		@user=User.find_by(name: params[:pages][:name])
		if @user
			session[:id]=@user.id
			redirect_to @user
		else
			flash.now[:failure]="User doesn't exist"
			render 'signup'
		end
	end


	def go_to
		event=Event.where(id: params[:event]).take
		@user=current_user
		@user.attended_events<<event unless event.atendees.where(id: current_user.id).any?
     	clear_invitation

	end

	def dont_go
		event=Event.where(id: params[:event]).take
		current_user.attended_events.delete(event) 
		clear_invitation
	end

	def clear_invitation
		invitation=Invitation.find_by(event_id: params[:event], user_id: params[:user])
		invitation.destroy
		redirect_to request.referrer or root_path
	end

end
