class Message < ApplicationRecord
  belongs_to :user

  after_commit :message_broadcast, on: [:create, :update]

  private
  def message_broadcast
    MessageBroadcastJob.perform_later self
  end
end
