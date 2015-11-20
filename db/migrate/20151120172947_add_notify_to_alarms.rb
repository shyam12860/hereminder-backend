class AddNotifyToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :notify_users, :text
  end
end
