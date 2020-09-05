class CommenttChannel < ApplicationCable::Channel
  def subscribed
    stream_from "commentt_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
