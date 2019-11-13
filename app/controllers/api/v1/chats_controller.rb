class Api::V1::ChatsController < ApplicationController
  
  before_action :find_chat, only: %i[show destroy]
  # breaking convention for the sake of reducing amount of data transferred
  # def index
  #   @my_dms = current_user.chats.dms
  #   @my_pris = current_user.chats.pris
  #   @all_pubs = current_user.chats.pubs
  # end

  def index
    @chats = Chat.all
    render json: { chats: @chats }
  end

  def show
    render json: { chat: @chat }
  end

  # if the type of chat is a private or public group chat,
  # set the host_id using the current_user id inside of the create
  # action instead of getting that information from the browser in the
  # form of params (JSON).

  def create
    @chat = Chat.new(chat_params)
    if @chat.valid?
      @chat.save
      render json: { chat: @chat }, status: :created
    else 
      render json: { errors: @chat.errors.full_messages }, status: :not_acceptable
    end
  end

  # def destroy
  #   @error = ''
  #   begin
  #     if find_user != nil
  #       find_user
  #       @user.destroy
  #     end
  #   rescue StandardError => e
  #     @error = "#{e}"
  #   end
  #   render json: { message: "Content deleted." }, status: :no_content
  # end

  def destroy
    begin
      find_chat
      @chat.destroy
    rescue StandardError => e
      @error = "#{e}"
    ensure
      render json: { message: "Content deleted." }, status: :no_content
    end
  end

  private 
  
  def find_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:chat_type, :name)
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