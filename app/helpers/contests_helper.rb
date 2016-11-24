module ContestsHelper

	# def checkerboard(board)
	# 	i = 0
	# 	x = 1
	# 	board_string = ""
	# 10.times do 
	# 	board_string += "<div class='row"
	# 	board_string += x.to_s 
	# 	board_string += "'>"
	# 	p board_string
	# 	board_string += "<div class='col s1 away_num'>"
	# 	 board_string += board.away_axis[0] 
	# 	 p "after rubyyyyyyy"
	# 	 p board_string
	# 	 x += 1
	# 	10.times do 
	# 		board_string += "<div class='col s1 square'>"
	# 		board_string +=
 #     "<input type='checkbox' id="
 #     board_string += i.to_s

 #     board_string += "name='cell' value="
	#  board_string += i.to_s
	#  board_string += "/><label for="
	#  board_string += i.to_s
	#  board_string += "></label></div></div>"
	# 			i += 1
	# 		end
	# 		board_string += "<br>"
	# 	end
	# 	board_string
	# end

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

	def away_axis_populater(board)
		return "<div class='row one'>
	  <div class='col s1 away_num'>" + board.away_axis[0] + "</div>"
	end

	def row_checkbox_populater
		z = 0
		string = ''
		10.times do 
			string +=
			"<div class='col s1 square'>
			  <input type='checkbox' id='#{z}' name='cell' value='#{z}'/>
			  <label for='#{z}'></label>
			</div>"
			z += 1
		end
		return string
	end
	
end