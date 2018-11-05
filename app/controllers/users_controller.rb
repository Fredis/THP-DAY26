class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	user_params = params.require(:user).permit(:prenom, :nom, :email, :password)
  	@user = User.create(user_params)
  end

end
