class Contest < ActiveRecord::Base
  has_many :cells
  has_many :users

  before_save :shuffler, :populate_range

  def shuffler
    self.home_axis = self.home_axis.shuffle
    self.away_axis = self.away_axis.shuffle
  end

  def populate_range
  	self.available_nums = (0..99).to_a
  end

  def remove_selected_num(board, number)
    board.delete!(number)
    board
  end



end
