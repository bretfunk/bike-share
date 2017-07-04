class TripForm
  include ActiveModel::Model
  attr_accessor(
    :duration,
    :start_date,
    :start_station_name,
    :end_date,
    :end_station_name,
    :bike_id,
    :subscription_type,
    :zip_code
)

    validates  :duration, presence: true
    validates  :start_date, presence: true
    validates  :start_station_name, presence: true
    validates  :end_date, presence: true
    validates  :end_station_name, presence: true
    validates  :bike_id, presence: true
    validates  :subscription_type, presence: true
    validates  :zip_code, presence: true

  def initialize(params)
    @duration = params[:duration]
    @start_date = params[:start_date]
    @start_station_name = params[:start_station_name]
    @end_date = params[:end_date]
    @end_station_name = params[:end_station_name]
    @subscription_type = params[:subscription_type]
    @bike_id = params[:bike_id]
    @zip_code = params[:zip_code]
  end

  def save
    if valid?
      save_start_date = BikeShareDate.find_or_create_by!(bike_share_date: @start_date)
      save_start_station_name = StationName.find_by(name: @start_station_name)
      save_end_date = BikeShareDate.find_or_create_by!(bike_share_date: @end_date)
      save_end_station_name = StationName.find_by(name: @end_station_name)
      save_subscription_type = SubscriptionType.find_or_create_by!(name: @subscription_type)
      save_zip_code = ZipCode.find_or_create_by!(zip_code: @zip_code)
      @trip = Trip.new(       duration: @duration,
                              start_date_id: save_start_date.id,
                              start_station_name_id: save_start_station_name.id,
                              end_date_id: save_end_date.id,
                              end_station_name_id: save_end_station_name.id,
                              subscription_type_id: save_subscription_type.id,
                              bike_id: @bike_id,
                              zip_code_id: save_zip_code.id
                              )
     return  @trip.save
     false
   end
  end
end
