class CellsController < ApplicationController

	def create
		@cell = Cell.new(cell_params)
		if @cell.save

		else
			flash[:notice] = "Error. Cell not saved"
			# redirect_to new_user_registration_path
		end
			render '_board'
	end

	

	private
	def cell_params
		params.require(:cell).permit(:user_id, :contest_id, :position => [], :result => [])
	end

end
