class AddDeviceToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :device, foreign_key: true
  end
end
