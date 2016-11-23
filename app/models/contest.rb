class Contest < ActiveRecord::Base
  has_many :cells
  has_many :users
end
