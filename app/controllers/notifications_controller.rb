class NotificationsController < ApplicationController

  def create
    Notification.create device_id: params[:device_id]
    response = Faraday.post 'http://fsf-rails-notif-staging.herokuapp.com/messages', { device_id: params[:device_id] }
    render plain: response.body
  end

  def index
    render json: Notification.all
  end

  def sanitycheck
    render plain: "Yes I'm alive mom"
  end

end
