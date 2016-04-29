class CallbacksController < Devise::OmniauthCallbacksController
	def github
		@user = User.from_omniauth(request.env["omniauth.auth"])

		session[:github_data] = request.env["omniauth.auth"]
    	session[:user_id] = @user.id

		sign_in_and_redirect @user
	end
end
