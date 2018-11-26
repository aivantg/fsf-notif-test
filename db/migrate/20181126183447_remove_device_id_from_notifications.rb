class RemoveDeviceIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :device_id, :string
  end
end
