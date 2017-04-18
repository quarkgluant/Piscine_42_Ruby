class UsersController < ApplicationController

  def index
    
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password]
      @user = User.new(user_params)
      @user.save
    end

  end

  def login
  end

  def logout
  end

  def connect
  end

  def signin
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def user_connect_params
      params.require(:user).permit(:email, :password)
    end
end
