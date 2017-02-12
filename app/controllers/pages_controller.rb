class PagesController < ApplicationController

	def landing
		if current_user
			redirect_to 'dashboard'
		else
			render 'landing', layout: false
		end
	end
end
