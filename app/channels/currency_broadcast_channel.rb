# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CurrencyBroadcastChannel < ApplicationCable::Channel
  # def subscribed
  #   # stream_from "some_channel"
  # end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end

  # def send
  # end

  def follow()
    stop_all_streams
    stream_from "/"
  end

  def unfollow
    stop_all_streams
  end
end
