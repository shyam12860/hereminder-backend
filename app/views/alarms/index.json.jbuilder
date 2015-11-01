json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :title, :note, :latitude, :longitude, :user_id, :address, :radius, :status
  json.url alarm_url(alarm, format: :json)
end
