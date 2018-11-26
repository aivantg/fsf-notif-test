class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :version
      t.string :uuid
      t.string :type

      t.timestamps
    end
  end
end
