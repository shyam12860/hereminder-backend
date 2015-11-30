class HardWorker
  include Sidekiq::Worker
  def perform(alarm_id)
    #send push notifications
    print "========================================================================"

    alarm = Alarm.find(alarm_id)
    user = User.find(alarm.user_id)
    device_token = user.apns_token

    print device_token
	APNS.send_notification(device_token, 'Hello iPhone!' )
	# APNS.send_notification(device_token, :alert => 'Hello iPhone!', :badge => 1, :sound => 'default')
    # user_ids = JSON.parse(alarm.notify_users)

    # user_ids.each_do |id|
    # 	user = User.find(id)
    # 	if user.apns_token
    # 		#send apns notification
    # 	end

    # 	if user.gcm_token
    # 		#send gcm notification
    # 	end
    # end
  end
end