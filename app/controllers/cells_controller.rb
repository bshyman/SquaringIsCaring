class CellsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
			@board = Contest.find_by(id: params[:contest_id])
		if closed?(@board)    
			flash[:error] = "Error. No Longer Available"
		else
			cell_params[:position].each do |cell|

				@cell = Cell.new(cell_params)
				@cell.position = [cell]

				# p @cell
				@cell.user_id = current_user.id
				@cell.save
				new_board = remove_selected_nums(@board, @cell.position)
				
				if @cell.persisted?
				assign_closed_positions(@board, @cell)
					@board.update_attributes(:available_nums => new_board)
				else
					flash[:error] = "Error. Cell not saved"
					redirect_to login_path
				end
			end
		end
			redirect_to contest_path(@board)
	end

	def show
		@cells = Cell.where(contest_id: params[:contest_id] )
		# p cell_params
		# @cell = Cell.find(params[:id])
		render json: @cells
	end
	
	private

	def cell_params
		params.require(:cell).permit(:user_id, :contest_id, :cell, :positionx, :positiony, :position => [])
	end
end