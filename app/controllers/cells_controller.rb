class CellsController < ApplicationController

	def create
		@board = Contest.find_by(id: params[:contest_id])
		@cell = Cell.new(cell_params)

		if request.xhr?
			if @cell.save
				remove_selected_num(@board, number)			
			else
				flash[:notice] = "Error. Cell not saved"
				# redirect_to new_user_registration_path
			end

		else
			flash[:notice] = "Error. No ajax"
		end

		render '_board'
	end

	private
	def cell_params
		params.permit(:user_id, :contest_id, :position => [], :result => [])
	end

end
