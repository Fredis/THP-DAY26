class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        flash.now[:success] = "Welcome"
        redirect_to '/'
      else
        render 'new'
      end 
  end

  def show
    @user = User.find(params[:id])
    if !logged_in?
      flash[:danger] = "CONNECTE-TOI CONNARD" 
      redirect_to login_path
    end 
  end 

  def index 
    if !logged_in?
      flash[:danger] = "CONNECTE-TOI CONNARD" 
      redirect_to login_path
    end 
    @users = User.all 
  end 

  def destroy 
    @user = User.find(params[:id])
    @user.destroy 
    redirect_to '/'
  end 

  def edit
    @user = User.find(current_user.id)
  end


  def update

    @user = User.find(current_user.id)
    puts '/////'
    @user.update(user_params)
    redirect_to users_path

  end

  private 

  def user_params
    user_params = params.require(:user).permit(:prenom, :nom, :email, :password, :password_confirmation)
  end 

end
