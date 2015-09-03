class EvsController < ApplicationController

  layout false
   
  def index
    @ev = Ev.order("name ASC")

  end

  def show
    @ev = Ev.find(params[:id])
    
  end
  def view
    @user= User.find(params[:id])
    @j = EventUser.where(user_id: @user.id)
      @d = @user.id
      @u = []
    @j.each do |j|
      @u <<j.ev_id
    end
    
      @ev= Ev.where(id: @u)  
  end
  def myevents
    @user =User.find(params[:id])
    @ev = Ev.where(username: @user.username)
  end

  def new
    @user= User.find(params[:id])
    @d = @user.id
  end
  def create
    @user= User.find(params[:id])
    @j = EventUser.new
    @ev = Ev.new(params.require(:ev).permit(:name,:date,:description,:location))
    if @ev.not_exists?(username: @ev.username)
      @ev.username = @user.username
    end
    if @ev.save
      @ev.event_users << @j
      @user.event_users << @j
      redirect_to(:action => 'index')
    else
      render('new')
    end 
    
  end



  def edit
    if Ev.exists?(username: params[:username] , id: params[:id])
      @ev = Ev.find(params[:id])
    else
      render('myevents')
    end
  end

  def update
    @ev = Ev.find(params[:id])
    
    if @ev.update_attributes(params.require(:ev).permit(:name,:date,:description,:location))
      redirect_to(:action => 'show' , :id => @ev.id)
    else
      render('edit')
    end  
  end

  def delete
    @ev = Ev.find(params[:id])
  end

  def destroy
    ev = Ev.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end
end
