class SessionsController < ApplicationController
  protect_from_forgery
  include SessionsHelper
  def new

  end
  def create
    user = User.find_by_username(params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash.now[:success] = 'Have nice day :)'
      redirect_to user
    else
      flash.now[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end
  def destroy
    sign_out
    redirect_to root_url
  end

end
