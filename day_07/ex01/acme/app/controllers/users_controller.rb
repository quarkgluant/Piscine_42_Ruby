class UsersController < ApplicationController
  # def new
  #   @user = User.new
  # end

  # def create
  #   # if params[:user][:password] == params[:user][:password_confirmation]
  #   #   @user = User.new(user_params)
  #   #   if @user.save
  #   #     redirect_to root_path
  #   #   else
  #   #     render "signin"
  #   #   end
  #   # else
  #   #   @user = User.new(name: params[:user][:name], password: params[:user][:password], email: params[:user][:email])
  #   #   render "sign_in", notice: "Password don't match"
  #   # end
  # end


  # def edit
  #   @user
  # end

  # def show
  #   @users = User.all
  # end

  # # def log_out
    
  # # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio)
  end

  def user_edit_params
    params.require(:user).permit(:name, :email, :password, :bio)
  end

end
