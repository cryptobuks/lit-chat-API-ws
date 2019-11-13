class Api::V1::ChatsController < ApplicationController
  def index

  end

  def show
    @chat = Chat.find(params[:id])
    render json: { chat: @chat }
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.valid?
      @chat.save
      render json: { chat: @chat }, status: :created
    else 
      render json: { errors: @chat.errors.full_messages }, status: :not_acceptable
    end
  end

  private 

  def chat_params
    params.require(:user).permit(:chat_type, :name, :description)
  end
end

=begin

def index
  @users = User.all
  render json: { users: @users }
end

def create
  @user = User.new(user_params)
  if @user.valid?
    @user.save
    render json: { user: @user }, status: :created
  else 
    render json: { errors: @user.errors.full_messages }, status: :not_acceptable
  end
end

def update
  if @user.update(user_params)
    render json: { user: @user }, status: :accepted
  else 
    render json: { errors: @user.errors.full_messages }, status: :not_acceptable
  end
end

def destroy
  @error = ''
  begin
    if find_user != nil
      find_user
      @user.destroy
    end
  rescue StandardError => e
    @error = "#{e}"
  end
  render json: { message: "Content deleted." }, status: :no_content
end

private 

def find_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:username, :age, :cool_points)
end

=end