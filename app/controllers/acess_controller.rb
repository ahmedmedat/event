class AcessController < ApplicationController
  
  def index
    @user = User.find(params[:id])
  end

  def login

  end

  def attempt_login
   if params[:username].present? && params[:password].present?	
     if User.exists?(username: params[:username] , password: params[:password])
         @user = User.find_by_username(params[:username])
    	   redirect_to(:action => 'index',:id => @user.id)
     else
    	 redirect_to(:action => 'login')
     end
   else
    redirect_to(:action => 'login')
   end
  end

  def logout
  	redirect_to(:action => "login")
  end
end
