class AddDeviceTokensToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apns_token, :text
    add_column :users, :gcm_token, :text
  end
end
