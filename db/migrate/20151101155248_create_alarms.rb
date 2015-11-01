class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :title
      t.text :note
      t.decimal :latitude
      t.decimal :longitude
      t.integer :user_id
      t.text :address
      t.decimal :radius
      t.boolean :status

      t.timestamps null: false
    end
  end
end
