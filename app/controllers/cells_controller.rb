class CellsController < ApplicationController

	def create
		p current_user

		@board = Contest.find_by(id: params[:contest_id])
		@cell = Cell.new(cell_params)
		p "PARRRRRRAAAAMMMMMS"
		p params
		p @cell.inspect
		p current_user
		# if request.xhr?
			if @cell.save
				p "SAVVEEEEDDD"
				remove_selected_num(@board, number)			
			else
				flash[:error] = "Error. Cell not saved"
				# redirect_to new_user_registration_path
				p "NOT SAVED"
			end

		# else
		# 	flash[:notice] = "Error. No ajax"
		# end

		redirect_to contest_path(@board)
	end

	private

	def cell_params
		params.permit(:user_id, :contest_id, :position => [], :result => [])
	end
end
