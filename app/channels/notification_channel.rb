class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    user_notification = Notification.find(params[user_id])
    stream_for user_notification
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
