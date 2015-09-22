<<<<<<< HEAD
module LoginHelper

	def log_in(user)
    session[:user_id] = user.id
  end


def current_user=(user)
@current_user = user
end

end
=======

module LoginHelper

	def log_in(user)
    session[:user_id] = user.id
  end



end

>>>>>>> aa6a37e5c64ad46a60d80c128395eef14bd6a3b3
