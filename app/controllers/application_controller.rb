class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  protected #===================================FILTER METHODS===============================================
 	
	def authenticate_user_token
		if auth = request.headers['authToken']
			check = FbGraph2::User.me(request.headers['authToken']).fetch(fields: [:id,:name, :email, :first_name, :last_name])
			check.fetch
			if check
				u = User.where(email: check.email)

				if u.length > 0
					@user = u.first
					@user.fbid = check.id
					if params['apns_token']
						@user.apns_token = params['apns_token']
					end
					if params['gcm_token']
						@user.gcm_token = params['gcm_token']
					end
					@user.save
				else

					@user = User.new(email: check.email, fbid: check.id)
					if params['apns_token']
						@user.apns_token = params['apns_token']
					end
					if params['gcm_token']
						@user.gcm_token = params['gcm_token']
					end
					@user.save
				end
			else
				render json: { error: 'Incorrect Auth Token.' },status: 401 and return
			end
		else
			render json: { error: "Missing Auth Token.", token:request.headers['authToken']},status: 401 and return
		end
	end
end
