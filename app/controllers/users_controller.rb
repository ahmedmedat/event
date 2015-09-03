class UsersController < ApplicationController
  
  layout false

  def index
    @user = User.order("username ASC")
  end

  def show
     @user = User.find(params[:id])

  end

  def new
  end
  
  def create

    @user = User.new(params.require(:user).permit(:username,:email,:password))
     
      if User.exists?(username: @user.username) || User.exists?(email: @user.email)
        render('new')
     else
       if @user.save
        redirect_to(:action => 'index')
       else
        render('new')
       end 
     end 
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params.require(:user).permit(:username,:email,:password))
      redirect_to(:action => 'show' , :id => @user.id)
    else
      render('edit')
    end  
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end
end
