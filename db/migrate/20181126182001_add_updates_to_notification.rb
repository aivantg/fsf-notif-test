class AddUpdatesToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :updates, :integer
  end
end
