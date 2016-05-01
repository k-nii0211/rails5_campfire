class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.messages.create! message_params
  end

  private
  def message_params
    params.require(:message).permit(:content).to_h
  end
end
