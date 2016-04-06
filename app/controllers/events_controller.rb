class EventsController < ApplicationController
  def index
  	@events=Event.all
  end

  def create
  	@user=User.find_by(id: session[:id])
  	@user.events.build(description: params[:event][:description], date: Time.now)
  	if @user.save
  		flash[:success]="You have created an event"
  		redirect_to @user
  	else
  		flash.now[:failure]="Please enter valid fields"
  		render 'new'
  	end

  end

  def show
  	@event=Event.find_by(id: params[:id])
  end

  def new
  	@event=Event.new
  end
end
