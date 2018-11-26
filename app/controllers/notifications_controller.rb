class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    Notification.create device_id: params[:device_id]
    # response = Faraday.post 'http://fsf-rails-notif-staging.herokuapp.com/messages', { device_id: params[:device_id] }
    render plain: "woo you did it"
  end

  def index
    render json: Notification.all
  end

  def sanitycheck
    render plain: "Yes I'm alive mom"
  end

end
