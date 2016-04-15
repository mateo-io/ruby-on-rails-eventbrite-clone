class InvitationsController < ApplicationController
	include ApplicationHelper


  def create
  	#Not taking into account, duplicate users, and events with the same name by the same user.
  	
  	#user being invited
  	@user=User.find_by(name: params[:invitation][:user])
 

  	#event being invited to
  	@event=Event.find_by(description: params[:invitation][:event])


#Don't send more than one invite
  	#Event not in user.attended_events
  	if  (!(@user.attended_events.find_by(id: @event.id).nil?) || !(@user.invitations.find_by(event_id: @event.id).nil?) )

  		flash[:danger]="User is already invited to the event"
  		redirect_to new_invitation_path and return

  	end


  	#Inviter is current user, invitee is @user
  	@user.invitations.build(event_id: @event.id, inviter: session[:id]) #Why does current_user.id not work?
  	@user.save
  	flash[:success]="Invitation was SENT!"
  	redirect_to new_invitation_path
    	
  end

   def new
  	@invitation=Invitation.new
  	#@events=current_user.invited_events if current_user.invited_events.any?
  end

  def destroy
  end
end
