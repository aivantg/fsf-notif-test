class AddAppVersionToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :app_version, :float
  end
end
