class CreateNetworkData < ActiveRecord::Migration
  def change
    create_table :network_data do |t|
      t.date :day
      t.float :sent
      t.float :received

      t.timestamps
    end
  end
end
