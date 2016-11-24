module ContestsHelper
	def home_axis_populater(board)
		i = 0
		home_axis_string = ""
     10.times do
     	home_axis_string += "<div class='col s1 home_num'>" +
     	 board.home_axis[i]+ "</div>"
     	i += 1
     	home_axis_string
  		end
  		home_axis_string 
	end

	def away_axis_populater(board, x)
		axis_val = board.away_axis[x]
		return "<div class='row #{x}'>
	  <div class='col s1 away_num'>" +  axis_val + "</div>"
	end

	def row_checkbox_populater
		z = 0
		string = ''
		10.times do 
			string +=
			"<div class='col s1 square'>
			  <input type='checkbox' id='#{z}' name='cell[position][]' value='#{z}'>
			  <label for='#{z}'></label>
			</div>"
			z += 1
		end
		return string + "</div>"
	end
	
	def ten_rows

	end
end