class StationForm
  include ActiveModel::Model

  attr_accessor(
    :station_name,
    :dock_count,
    :city,
    :installation_date
  )

  validates  :station_name, presence: true
  validates  :dock_count, presence: true
  validates  :city, presence: true
  validates  :installation_date, presence: true

  def initialize(params)
    # @station_name = StationName.find_or_initialize_by(name: params[:name])

    @station_name = params[:name]
    @dock_count = params[:dock_count]
    @city = params[:city]
    @installation_date = params[:installation_date]
    # @station = Station.new(station_name: @station_name,
    #                         dock_count: @dock_count,
    #                         city: @city,
    #                         installation_date_id: @installation_date.id
    #                         )
  end

  def save
    # require 'pry';binding.pry
    if valid?
      save_name = StationName.find_or_create_by!(name: @station_name)
      save_city = City.find_or_create_by!(name: @city)
      save_date =  BikeShareDate.find_or_create_by!(bike_share_date: @installation_date)
      @station = Station.new(station_name: save_name,
                              dock_count: @dock_count,
                              city: save_city,
                              installation_date_id: save_date.id
                              )
     return  @station.save
    end
    # return @station.save if valid?
    false
  end
end
