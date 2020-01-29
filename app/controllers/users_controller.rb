class UsersController < ApplicationController
   def new 
      @user = User.new 
   end
   
   def create
      @user = User.new(user_params)
      if @user.save
            flash[:positive] = "Welcome #{@user.username}"
            redirect_to root_path
        else
            flash[:negative] = "Something went wrong"
            render 'new'
        end
            
   end
   
   def show
      @user = User.find(params[:id]) 
   end
   
   private
   
   def user_params
      params.require(:user).permit(:username, :email, :password) 
   end
    
end