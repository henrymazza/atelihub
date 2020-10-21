class ProgressNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'progress_notification_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
