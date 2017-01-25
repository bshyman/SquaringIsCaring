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

  def row_checkbox_populater(row)
    z = 0
    string = ""
    10.times do
      string +=
      "<div class='col s1 square'>
      <label for='#{row}#{z}' value='#{row}#{z}'>
      <input type='checkbox' id='#{row}#{z}' name='cell[position][]' value='#{row}#{z}' >
      </label>
      </div>"
      z += 1
    end
    return string + "</div>"
  end

  def format_num(number)
    if number[0] == "0"
      number = number[1]
    end
    number
  end

  def remove_selected_nums(board, array)
    array.each do |number|
      board.available_nums.delete(format_num(number))
    end
    board.available_nums
  end

  def ended?(board)
    board.event_date <= DateTime.now || board.available_nums.length == 0
  end

  def pick_winning_cells(board)

  end

  def display_event_date_or_message(board)
    if board.event_date <= DateTime.now.utc
      return "Sorry. This Event Has Begun"
    else
      if board.available_nums.length == 0
        return "Sorry. All Cells Are Taken"
      end
    end
    board.event_date.utc.strftime("%B %e ,%l:%m %p" )
  end

end
