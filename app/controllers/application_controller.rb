class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  protected #===================================FILTER METHODS===============================================
 	
	def authenticate_user_token
		if auth = request.headers['authToken']
			check = FbGraph2::User.me(request.headers['authToken']).fetch(fields: [:name, :email, :first_name, :last_name])
			check.fetch
			if check
				u = User.where(email: check.email)
				
				if u.length > 0
					@user = u.first
				else
					# print "#===================================#==================================="
					@user = User.new(email: check.email)
					@user.save
				end
			else
				render json: { error: 'Incorrect Auth Token.' },status: 401 and return
			end
		else
			render json: { error: "Missing Auth Token.", token:request.headers['authToken']},status: 401 and return
		end
	end

	# def verify_access
	# 	render json: { error: 'Access denied.' },status: 403 and return unless Access.granted?((params[:controller]+"controller"),params[:action],@user.id)
	# end
end
