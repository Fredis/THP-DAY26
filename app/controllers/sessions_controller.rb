class SessionsController < ApplicationController
  
  def new

  end

  def create
  	user_params = params.require(:form_login).permit(:email, :password)
  	@user = User.find_by(email:user_params[:email])
  	puts "!!!!!!!!!!"
  	puts @user.email
  end

end
