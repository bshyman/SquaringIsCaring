class CellsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		@board = Contest.find_by(id: params[:contest_id])
		@cell = Cell.new(cell_params)
		@cell.user_id = current_user.id

		# p "PARRRRRRAAAAMMMMMS"
		# p params
		# p @cell.inspect
		# if request.xhr?
			if @cell.save
				new_board = remove_selected_nums(@board, @cell.position)
				# @cell.save
				@board.update_attributes(:available_nums => new_board)
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
