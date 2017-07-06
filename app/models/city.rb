class City < ActiveRecord::Base
  has_many :stations

  def name
    City.find(id)[:name]
  end
end
