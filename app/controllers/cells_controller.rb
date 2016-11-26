class CellsController < ApplicationController

	def create
		@cell = Cell.new(cell_params)
		if @cell.save
			render '_board'
		else
			flash[:notice] = "Error. Please Log in."
			redirect_to new_user_registration_path
		end
	end

	

	private
	def cell_params
		params.require(:cell).permit(:user_id, :contest_id, :position => [], :result => [])
	end

end
