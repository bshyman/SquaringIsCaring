class Contest < ActiveRecord::Base
  has_many :cells
  has_many :users
  before_save :shuffler

  def shuffler
    self.home_axis = self.home_axis.shuffle
    self.away_axis = self.away_axis.shuffle
  end
end
