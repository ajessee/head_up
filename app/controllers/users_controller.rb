class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:index, :show, :edit, :update]
  before_action :correct_user,    only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Sign up for headupinc.com successful!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    # Do not need @user here because we pull it from the DB in the correct_user before filter
  end

  def update
    # Same here
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end 
  end

  def show
    @user = User.find(params[:id])  
  end

  def index
    @users = User.all
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
