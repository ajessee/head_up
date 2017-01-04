class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update, :show]
  before_action :admin_user,      only: :destroy


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to '/#flash'
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
    redirect_to root_url and return unless @user.activated?
  end

  #show only activated users
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to '/users'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
