class Api::V1::UserChatsController < ApplicationController
  
  
  def create
  end

  def update
  end

  private

  def user_chat_params
    params.require(:user_chat).permit(:user_id => [], :chat_id => [], alert, banned)
  end
end
