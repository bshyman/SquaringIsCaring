class Contest < ActiveRecord::Base
  has_many :cells
  has_many :users

  before_create :shuffler, :populate_range
  # accepts_nested_attributes_for :box_score
  serialize :box_score


  def shuffler
    self.home_axis = self.home_axis.shuffle
    self.away_axis = self.away_axis.shuffle
  end

  

  def populate_range
  	self.available_nums = (0..99).to_a
  end

def event_name
    self.home_team + " Vs. " + self.away_team
  end

  def close_time
    (self.event_date.to_time - 15.minutes).to_datetime.utc.strftime("%l:%M %p")
  end

  def build_score_hash

  end
  
end
