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

  def show
    @user = User.find(params[:id])
    if request.xhr?
      @initials = id_in_initial_out(@user.id)
      render json: @initials
    end
  end

  def dashboard
  end

  
end
