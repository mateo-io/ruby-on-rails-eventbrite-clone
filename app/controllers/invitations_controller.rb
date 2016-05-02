class InvitationsController < ApplicationController
	include ApplicationHelper


  def create
  	#Not taking into account, duplicate users, and events with the same name by the same user.
  	
  	#User being invited
  	@user=User.find_by(id: params[:invitation][:user])
 
  	#event being invited to
  	@event=Event.find_by(id: params[:invitation][:event])


    invite=Invitation.find_by(event_id: @event.id, user_id: @user.id)
    #invite is nil if it doesn't exist. We have to check because they are never deleted.

    #User not in attended events
  	if  @user.attended_events.find_by(id: @event.id)

  		flash[:danger]="#{@user.name} is already going to the event"
  		redirect_to new_invitation_path and return

    #An invite already exists
    elsif  invite
      invite.show=1
      if invite.save
        flash[:success]="User was reinvited!"
        redirect_to new_invitation_path
      else
        flash[:danger]="Couldn't invite the user"
        redirect_to new_invitation_path
      end
    
    #Create the invitation
    else
        @user.invitations.build(event_id: @event.id, inviter: session[:id]) #Why does current_user.id not work?
        @user.save
        flash[:success]="Invitation was SENT!"
        redirect_to new_invitation_path

  	end
    	
  end

   def new
  	@invitation=Invitation.new
    
    @pending_invites=Invitation.where(user_id: current_user.id, show:1).each do |inv|
      inv if (inv && Event.find_by_id(inv.event_id).date>Time.now)      
    end 
  	
    @sent_invites=Invitation.where(inviter: current_user.id)

    @event_options=current_user.attended_events.future.map{|e| [e.description, e.id] }
    @names_options=User.all.reject{|u| u==current_user}.map{|u| [u.name, u.id] } 
  end

  def destroy
  end
end
