class PollChannel < ApplicationCable::Channel
  def subscribed
    stream_from "poll_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast("poll_channel", data)
  end
end