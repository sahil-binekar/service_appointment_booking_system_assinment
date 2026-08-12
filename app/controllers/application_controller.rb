class ApplicationController < ActionController::API
	include ActionController::MimeResponds
	include JsonWebToken
	include Devise::Controllers::Helpers
	def authenticate_user!
		token = request.headers['Authorization'].split(" ")[1]
		# binding.pry
		user_id = JsonWebToken.decode(token)[0].with_indifferent_access[:user_id]
		user = User.find_by(id: user_id)
		if user
			@current_user = user
		else
			error_response_format("user not authorized")
		end
		# user = params
	end

	def response_format(data)
		render json: {date: data, message: "success", status: 200 | 204}
	end

	def error_response_format(data)
		render json: {data: data, message: "fail", status: 404 | 400}		
	end

	rescue_from CanCan::AccessDenied do |exception|
	    respond_to do |format|
	      format.json { render json: { alert: exception.message} }
	    end
	end
end
