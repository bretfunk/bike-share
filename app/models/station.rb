class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :bike_share_date, foreign_key: :installation_date_id
  belongs_to :station_name, foreign_key: :station_name_id
  has_many   :trips

  def installation_date
    BikeShareDate.find(installation_date_id).bike_share_date
  end


  def name
   StationName.find(station_name_id).name
  end

  def city
    City.find(city_id).name
  end

  def self.sql(query)
    ActiveRecord::Base.connection.exec_query(query)
  end

  def self.total_station_count
    sql("SELECT COUNT(id) FROM stations").first["count"].to_i
    #Station.all.count
  end

  def self.average_bikes_per_station
    sql("SELECT AVG(dock_count)FROM stations").first["avg"].to_i
  end

  def self.most_bikes_available
    station = Station.order(:dock_count).last
    station.station_name.name
  end

  def self.stations_with_most_bikes
    Station.order(dock_count: :desc).limit(5)
  end

  def self.fewest_bikes_avaiable
    station = Station.order(:dock_count).first
    station.station_name.name
  end

  def self.stations_with_fewest_bikes
    Station.order(dock_count: :asc).limit(5)
  end

  def self.most_recent_station
    Station.joins("JOIN bike_share_dates ON bike_share_dates.id = stations.installation_date_id").order("bike_share_dates.bike_share_date asc").last.station_name.name
  end

  def self.oldest_station
    Station.joins("JOIN bike_share_dates ON bike_share_dates.id = stations.installation_date_id").order("bike_share_dates.bike_share_date asc").first.station_name.name
  end

  def origination_rides(id)
    Trip.where(start_station_id: id).count
  end

  def destination_rides(id)
    Trip.where(end_station_id: id).count
  end

  def most_frequent_destination(id)
    Trip.where(start_station_id: id)
      .group(:end_station_id)
      .order("count_id DESC")
      .count(:id).keys.first
  end

  def most_frequent_origination(id)
    Trip.where(end_station_id: id)
      .group(:start_station_id)
      .order("count_id DESC")
      .count(:id).keys.first
  end

  def date_of_most_rides(id)
    date_id = Trip.where(start_station_id: id)
      .group(:start_date_id)
      .order("count_id DESC")
      .count(:id).keys.first
    BikeShareDate.find(id).bike_share_date
  end

  def most_frequent_user_zip(id)
    Trip.where(start_station_id: id)
      .group(:zip_code_id)
      .order("count_id DESC")
      .count(:id).keys.first
  end

  def most_frequent_bike(id)
    Trip.where(start_station_id: id)
      .group(:bike_id)
      .order("count_id DESC")
      .count(:id).keys.first
  end
end
