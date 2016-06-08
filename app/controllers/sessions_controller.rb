class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # placeholder - login successful
    else
      # Invalid email/password. Return error message and render new session page
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
  end
end
