class UpdateConditionForm
  include ActiveModel::Model

  attr_accessor(
    :date,
    :max_temperature_f,
    :mean_temperature_f,
    :min_temperature_f,
    :mean_humidity,
    :mean_visibility_miles,
    :mean_humidity,
    :mean_wind_speed_mph,
    :precipitation_inches
  )

  validates  :date, presence: true
  validates  :max_temperature_f, presence: true
  validates  :mean_temperature_f, presence: true
  validates  :min_temperature_f, presence: true
  validates  :mean_humidity, presence: true
  validates  :mean_visibility_miles, presence: true
  validates  :mean_humidity, presence: true
  validates  :mean_wind_speed_mph, presence: true
  validates  :precipitation_inches, presence: true

  def initialize(params)
    @date = params[:weather][:date]
    @max_temperature_f = params[:weather][:max_temperature_f]
    @mean_temperature_f = params[:weather][:mean_temperature_f]
    @min_temperature_f = params[:weather][:min_temperature_f]
    @mean_humidity = params[:weather][:mean_humidity]
    @mean_visibility_miles = params[:weather][:mean_visibility_miles]
    @mean_humidity = params[:weather][:mean_humidity]
    @mean_wind_speed_mph = params[:weather][:mean_wind_speed_mph]
    @precipitation_inches = params[:weather][:precipitation_inches]
    @id = params[:id]
  end

  def save
    if valid?
      save_date = BikeShareDate.find_or_create_by!(bike_share_date: @date)
      @condition = Weather.update(@id,
                              bike_share_date:       save_date,
                              max_temperature_f:     @max_temperature_f,
                              mean_temperature_f:    @mean_temperature_f,
                              min_temperature_f:     @min_temperature_f,
                              mean_humidity:         @mean_humidity,
                              mean_visibility_miles: @mean_visibility_miles,
                              mean_humidity:         @mean_humidity,
                              mean_wind_speed_mph:   @mean_wind_speed_mph,
                              precipitation_inches:  @precipitation_inches
                              )
    else
      false
    end
  end
end
