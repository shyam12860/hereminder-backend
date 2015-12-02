class HardWorker
  include Sidekiq::Worker
  def perform(alarm_id)
    #send push notifications
    alarm = Alarm.find(alarm_id)
    APNS.host = 'gateway.sandbox.push.apple.com' 
	APNS.port = 2195
	APNS.pem  = Rails.root.join('private','ck.pem')
	APNS.pass = 'hereminder'
	if alarm.notify_users and alarm.notify_users != "null"

    	fbids = JSON.parse(alarm.notify_users)
	    notifications = []
	    fbids.each do |id|
	    	user = User.where(fbid: id).first
	    	if user.apns_token
	    		#send apns notification
	    		# APNS.send_notification(user.apns_token, 'Your friend has reached' + alarm.address)
	    		notifications.push(APNS::Notification.new(user.apns_token, :alert => 'Your friend has reached' + alarm.address, :badge => 1, :sound => 'default'))
	    	end

	    	if user.gcm_token
	   #  		#send gcm notification
	   #  		GCM.host = 'https://android.googleapis.com/gcm/send'
				# # https://android.googleapis.com/gcm/send is default

				# GCM.format = :json
				# # :json is default and only available at the moment

				# # GCM.key = "123abc456def"
	    	end


	    end


	    APNS.send_notifications(notifications)
	end
  end

end