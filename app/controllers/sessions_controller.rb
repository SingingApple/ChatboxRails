class SessionsController < ApplicationController
   before_action :logged_in_redirect, only: [:new, :create]
   def new
      
   end
   
   def create
   user = User.find_by(username: params[:session][:username].downcase)
   if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:positive] = "You've successfully logged in"
      redirect_to user_path(user)
   else
      flash[:negative] = "Something went wrong"
      render 'new'
   end
end
   
   def destroy
      session[:user_id] = nil
      flash[:positive] = "Logged out"
      redirect_to root_path
   end
   
   private
   
   def logged_in_redirect
      if logged_in?
         flash[:error] = "You're already logged in."
         redirect_to root_path
      end
   end
end