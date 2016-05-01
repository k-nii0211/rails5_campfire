class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:edit, :update]

  def create
    @message = current_user.messages.create! message_params
  end

  def edit
  end

  def update
    @message.update_attributes!(message_params)
    redirect_to root_url
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

  def set_message
    @message = current_user.messages.find(params[:id])
  end
end
