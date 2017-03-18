module UsersHelper

# 	def admin?
# 		current_user.admin? 
# 	end

# 	# def current_user
# 	# 	@cached_user = @cached_user || User.find_by(id: session[:user_id])
# 	# end

	def logged_in?
    	current_user != nil
  	end

	def recent
		Cell.where(user_id: current_user.id).order(created_at: :desc).limit(5)
		
	end

	def ids_in_initials_out(users)
		user_initials = {}
		users.each do |user|
			user_initials[user.id] = user.first_name[0] + user.last_name[0]
		end
		user_initials	
	end

	def id_in_initial_out(user_id)
		@user = User.find(user_id)
		@user.first_name[0] + @user.last_name[0]
	end
end