class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    if params[:uuid]
      d = Device.find_by(uuid: params[:uuid])
      response = "Recorded Notification"
      if d.nil?
        d = Device.create uuid: params[:uuid]
        response = "No registered device. Recording anyway"
      end

      Notification.create device: d, updates: params[:updates]
      render plain: response
    end
  end

  def index
    @devices = Device.all
  end

  def register
    puts params
    device = Device.find_by(uuid: params[:uuid])
    if device.nil?
      Device.create version: params[:version], device_type: params[:type], uuid: params[:uuid], app_version: params[:app_version]
      render plain: "Registered Device"
    else
      device.update version: params[:version], device_type: params[:type], app_version: params[:app_version]
      render plain: "Device already registered"
    end
  end

  def home
    redirect_to notifications_index_path
  end

end
