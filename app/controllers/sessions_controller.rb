class SessionsController < ApplicationController
def new
end

  def create

    user = User.find_by(email_id: params[:session][:email_id])
    if user && user.authenticate(params[:session][:email_id], params[:session][:login_password])
      # Sign the user in and redirect to the user's show page.
	flash.now[:error]='Signed in successfully'
	render 'new'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    
    end
  end
  

  def destroy
  end
end
