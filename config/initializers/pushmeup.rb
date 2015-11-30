# APNS.host = 'gateway.push.apple.com' 
# gateway.sandbox.push.apple.com is default and only for development
# gateway.push.apple.com is only for production

APNS.port = 2195 
# this is also the default. Shouldn't ever have to set this, but just in case Apple goes crazy, you can.

APNS.pem  = '#{Rails.root}/private/HereminderCert.pem'
# this is the file you just created

APNS.pass = 'hereminder'
# Just in case your pem need a password

GCM.host = 'https://android.googleapis.com/gcm/send'
# https://android.googleapis.com/gcm/send is default

GCM.format = :json
# :json is default and only available at the moment

GCM.key = "123abc456def"
# this is the apiKey obtained from here https://code.google.com/apis/console/
