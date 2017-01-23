class CellsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		# until condition
			
		# end
		@board = Contest.find_by(id: params[:contest_id])
		p @board.event_date
		@cell = Cell.new(cell_params)
		@cell.user_id = current_user.id
		@cell.save
		new_board = remove_selected_nums(@board, @cell.position)
		if @cell.persisted?
			@board.update_attributes(:available_nums => new_board)
		else
			flash[:error] = "Error. Cell not saved"
			redirect_to login_path
		end
		redirect_to contest_path(@board)
	end
	
	private

	def cell_params
		params.require(:cell).permit(:user_id, :contest_id, :cell, :position => [])
	end
end