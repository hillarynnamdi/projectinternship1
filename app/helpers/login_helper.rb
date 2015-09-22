module LoginHelper

	def log_in(user)
    session[:user_id] = user.id
  end


def current_user=(user)
@current_user = user
end

end
