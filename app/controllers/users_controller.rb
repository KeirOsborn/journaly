class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
      if @user.save
        session[:user] = @user.id
        redirect_to user_path(@user)
      else render :new

      end

  end

  def show
    @trip = Trip.new
    @user = User.find(params[:id])
  end

end
