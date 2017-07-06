class BikeShareDate < ActiveRecord::Base
  has_many :stations, :foreign_key => 'installation_date_id'
  has_many :trips
  has_many :weathers
end
