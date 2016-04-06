class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
  		flash[:success]="User created successfully"
  		redirect_to @user
  	else
  		flash.now[:warning]="Please check you information again"
  		render 'new'
  	end
  end

  def show
  	@user=User.find_by(id: params[:id])
  end



  private

  def user_params
  	params.require(:user).permit(:name)
  end
end
