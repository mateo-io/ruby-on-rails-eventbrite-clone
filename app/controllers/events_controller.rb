class EventsController < ApplicationController
  include DateHelper
  include UsersHelper
  def index
  	@events=Event.all
  end

  def create
    event=params[:event]
  	@user=User.find_by(id: session[:id])
  	
    #@user.events.build(description: event[:description], date: Date.new(event["date(1i)"].to_i, \
    #  event["date(2i)"].to_i, event["date(3i)"].to_i) )
    
    @user.events.build(description: event[:description], date: date_from_date_select_params(event, :date))
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
