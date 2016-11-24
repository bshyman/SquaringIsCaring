module ContestsHelper

	def checkerboard
		i = 0
		board = ""
	10.times do 
		10.times do 
			board += "
				<input type='checkbox' id=#{i} name='cell' value=#{i}/>
	    		  <label for=#{i}></label>
				"
				i += 1
			end
			board += "<br>"
		end
		board
	end
end