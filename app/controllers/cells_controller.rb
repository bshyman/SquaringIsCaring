class CellsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		@board = Contest.find_by(id: params[:contest_id])
		@cell = Cell.new(cell_params)
		p "POSITIONSSSS"
		p @cell.position.class

		p "PARRRRRRAAAAMMMMMS"
		p params
		p @cell.inspect
		# if request.xhr?
		p @board.available_nums
			if @cell.save
				p "SAVVEEEEDDD"
				remove_selected_nums(@board, @cell.position)	
				p 'REMOVVVED?'
				p @board.available_nums

			else
				flash[:error] = "Error. Cell not saved"
				# redirect_to new_user_registration_path
				p "NOT SAVED"
			end
		redirect_to contest_path(@board)
	end

	private
	def cell_params
		params.require(:cell).permit(:user_id, :contest_id, :position => [])
	end

end
