class PagesController < ApplicationController

	def landing
		if current_user
			redirect_to "/users/#{current_user.id}/dashboard"
		else
			render 'landing', layout: false
		end
	end
end
