class CellsController < ApplicationController

	

	private
	def cell_params
		params.require(:cell).permit(:user_id, :contest_id, :position, :result)
	end

end
