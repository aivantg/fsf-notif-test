class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    d = Device.find_by(uuid: params[:uuid])
    response = "Recorded Notification"
    if d.nil?
      d = Device.create uuid: params[:uuid]
      response = "No registered device. Recording anyway"
    end

    Notification.create device: d, updates: params[:updates]
    render plain: response
  end

  def index
    @devices = Device.all
  end

  def register
    if Device.find_by(uuid: params[:uuid]).nil?
      Device.create version: params[:version], type: params[:type], uuid: params[:uuid]
      render plain: "Registered Device"
    else
      render plain: "Device already registered"
    end
  end

  def home
    redirect_to notifications_index_path
  end

end
