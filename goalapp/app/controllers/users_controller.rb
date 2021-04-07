class UsersController < ApplicationController
  #index
  def index
    @users = User.all
    render :index
  end
  
  #show
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  #new
  def new
    @user = User.new
    render :new
  end

  #create
  def create
    @user = User.new(user_params)
    if @user.save!
      login!(@user)
      flash[:username] = @user.username
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end