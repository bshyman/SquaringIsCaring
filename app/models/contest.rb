class Contest < ActiveRecord::Base
  has_many :cells
  has_many :users

  before_create :shuffler, :populate_range
  before_save :capitalize_teams
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
    self.home_team + " at " + self.away_team
  end

  def close_time
    (self.event_date.to_time - 15.minutes).to_datetime.utc.strftime("%l:%M %p")
  end

  def self.search(search)
    search.capitalize!
    where("home_team LIKE ? OR away_team LIKE ?", "%#{search}%", "%#{search}%")
  end

  def capitalize_teams
    self.home_team = self.home_team.split.collect(&:capitalize).join(' ') if self.home_team && !self.home_team.blank?
    self.away_team = self.away_team.split.collect(&:capitalize).join(' ') if self.away_team && !self.away_team.blank?
  end
  
end
