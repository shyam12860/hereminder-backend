class AddDefaultToAlarms < ActiveRecord::Migration
  def change
  	change_column :alarms, :status, :boolean, :default => false
  end
end
