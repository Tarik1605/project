class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create

    user_params = params.require(:user).permit(:name, :last_name, :email, :password_digest)

    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    user_params = params.require(:user).permit(:name, :last_name, :email, :password_digest)

    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end
  
end