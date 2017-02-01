module ContestsHelper
  def home_axis_populater(board)
    i = 0
    home_axis_string = ""
    10.times do
      home_axis_string += "<div class='col s1 home_num'>" 
      if closed?(board)
       home_axis_string += board.home_axis[i] + "</div>"
      else
        home_axis_string += "🏈" + "</div>"
      end
      i += 1
      home_axis_string
    end
    home_axis_string
  end

  def away_axis_populater(board, x)
    axis_val = board.away_axis[x]
    html_string = "<div class='row #{x}'>
    <div class='col s1 away_num'>"
    if closed?(board)
      html_string += axis_val 
    else
      html_string +=  "🏈"
    end
       
     return html_string+ "</div>"
  end

  def row_checkbox_populater(row)
    z = 0
    string = ""
    10.times do
      string +=
      "<div class='col s1 square '>
      <label for='#{row}#{z}' value='#{row}#{z}'>
      <input type='checkbox' id='#{row}#{z}' name='cell[position][]' value='#{row}#{z}'>
      <end>
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
    array.each{|number| board.available_nums.delete(format_num(number))}
    board.available_nums
  end

  def closed?(board)
    p board

    (board.event_date.to_time - 15.minutes).to_datetime <= DateTime.now || board.available_nums.length == 0
  end

  def pick_first_winner(board)
      if board.box.score

  end

  def display_event_date_or_message(board)
    if closed?(board)
      return "Sorry. Squares Are Closed."
    else
      if board.available_nums.length == 0
        return "Sorry. All Cells Are Taken"
      end
    end
    # board.event_date.strftime("%b %e, %l:%M %p" )
    board.event_date.utc.strftime("%b %e, %l:%M %p")
  end

 

 



end
