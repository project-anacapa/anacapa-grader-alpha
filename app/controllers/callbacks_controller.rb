class CallbacksController < Devise::OmniauthCallbacksController
	def github
		@user = user.from_omniauth(request.env["omniauth.auth"])
		sign_in_and_redirect @user
	end
end