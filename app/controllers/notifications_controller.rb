class NotificationsController < ApplicationController

  def receive
    Notification.create device_id: params[:device_id]
    Faraday.post 'fsf-rails-notif-staging.herokuapp.com/messages', { :device_id: params[:device_id] }
  end

end
