class UsersController < ApplicationController
  
	def new
		@user = User.new
	end
	def create
		params.permit!
		@user = User.new(params[:user].permit(:username,  :encrypted_password,:email_id, :address, :phone_no))
		if @user.save
			flash[:notice] = "You signed up successfully"
			flash[:color]= "valid"
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
		end
		render "new"
	end
	
	private

    def user_params
      params.require(:user).permit(:username,  :encrypted_password,:email_id, :address, :phone_no)
    end

  
end
