module CellsHelper

	def find_position(board, cell)
		position = []
		row = cell[0]
		column = cell[1]
		position << board.home_axis(column)
		position << board.away_axis(row)
	end
	
end
