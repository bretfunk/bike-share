class StationName < ActiveRecord::Base
  has_many :stations
  has_many :trips
end
