class AccountConfirmationController < ApplicationController
skip_before_action :require_login

  def index
  end

  def show
	if session[:confirm_email]
		@user=Users.find_by(company_name: params[:id])
		session.delete(:confirm_email)
		
	else

		redirect_to login_index_path

  end
end

  def edit

  		user=Users.find_by(activation_token: params[:id])
			if user

<<<<<<< HEAD
				@activated=user.update_activation			
=======
				@activated=Users.update_all "account_activated = 'true', activation_token = ' ' "
				
>>>>>>> 61693db46d311cfaea957361435f88a706f0f4c9
				if @activated
				session[:confirm_email]="true"
				redirect_to account_confirmation_path(user.company_name)

			end
		
			else
				flash[:no_such_user] = 'User does not exist'
				redirect_to login_index_path
		end

  end
end

