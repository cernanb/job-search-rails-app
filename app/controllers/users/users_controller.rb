class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.profile_created = true
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :street_1, :street_2, :city, :state, :zip_code, :cell_phone, :description)
    end
end
