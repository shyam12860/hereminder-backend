class ChangeDecimalsInAlarms < ActiveRecord::Migration
  def change
  	change_column :alarms, :latitude, :decimal, :precision => 15, :scale => 10
  	change_column :alarms, :longitude, :decimal, :precision => 15, :scale => 10
  	change_column :alarms, :radius, :decimal, :precision => 15, :scale => 10
  end
end
