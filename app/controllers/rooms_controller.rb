class RoomsController < ApplicationController
  def show
    @messages = Message.last(10)
  end
end
