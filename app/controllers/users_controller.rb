class UsersController < ApplicationController
  def index
  	@users = User.all
  	
  	if request.xhr?
  		@response  = ids_in_initials_out(@users)
  		render json: @response
  	else
  		render 'index'
  	end
  end

  def dashboard
  end
end
