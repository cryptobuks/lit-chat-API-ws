class Api::V1::UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      byebug
      render json: { user: @user }, status: :created
    else 
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
  end

  def destroy
  end

  def profile
  end

  def last_login
  end

  private 

  def find_user
  end

  def user_params
    params.require(:user).permit(:age, :username)
  end

end
