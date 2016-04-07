class PagesController < ApplicationController
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
end
