class Admin::UsersController < ApplicationController

  before_action :user_admin_only

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "New user created: #{@user.firstname} #{@user.lastname}"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admins_user_path, notice: "User updated: #{@user.firstname} #{@user.lastname}"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path, notice: "User deleted: #{@user.firstname} #{@user.lastname}"
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

  private

  def user_admin_only
    unless current_user.admin
      flash[:alert] = "Access to this page requires admin privileges"
      redirect_to root_path
    end
  end

end