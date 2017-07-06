class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/station-dashboard' do
    @count = Station.total_station_count
    @average = Station.average_bikes_per_station
    @most_bikes = Station.most_bikes_available
    @stations_with_most_bikes = Station.stations_with_most_bikes
    @fewest_bikes_avaiable = Station.fewest_bikes_avaiable
    @stations_with_fewest_bikes = Station.stations_with_fewest_bikes
    @most_recent_station = Station.most_recent_station
    @oldest_station = Station.oldest_station
    erb :"stations/station-dashboard"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])

    erb :"stations/show"
  end

  post '/stations/new' do
    sf = StationForm.new(params[:station])
      if sf.save
        redirect '/stations'
      else
        @errors = sf.errors
        erb :"/stations/new"
      end
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    usf = UpdateStationForm.new(params)
    if usf.save
      redirect "/stations/#{params[:id]}"
    else
      @errors = usf.errors
      @station = Station.find(params[:id])
      erb :"/stations/edit"
    end
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  get '/trip-dashboard' do
    @average_duration_of_a_ride = Trip.average_duration_of_a_ride
    @longest_ride = Trip.longest_ride
    @shortest_ride = Trip.shortest_ride
    @most_starting_station_rides = Trip.most_starting_station_rides
    @most_ending_station_rides = Trip.most_ending_station_rides
    @month_by_month_breakdown = Trip.month_by_month_breakdown
    @least_ridden_bike = Trip.least_ridden_bike
    @most_ridden_bike = Trip.most_ridden_bike
    @least_ridden_bike_number = Trip.least_ridden_bike_number
    @most_ridden_bike_number = Trip.most_ridden_bike_number
    @user_subscription_count = Trip.user_subscription_count
    @user_subscription_percentage = Trip.user_subscription_percentage
    @day_of_highest_trips = Trip.day_of_highest_trips
    @day_of_lowest_trips = Trip.day_of_lowest_trips
    @day_of_highest_trips_number = Trip.day_of_highest_trips_number
    @day_of_lowest_trips_number = Trip.day_of_lowest_trips_number
    erb :"trips/trips-dashboard"
  end

  get '/trips' do
    @trips = Trip.all.order(:id).paginate(:page => params[:page], :per_page => 30)
    erb :"trips/index"
  end

  get '/trips/new' do
    @station_names = StationName.all.order(:name)
    erb :"trips/new"
  end

  get '/trips/:id' do
      @trip = Trip.find(params[:id])
      erb :"trips/show"
  end

  post '/trips/new' do
    tf = TripForm.new(params[:trip])
      if tf.save
        redirect "/trips"
      else
        @errors = tf.errors
        erb :"/stations/new"
      end
    end

  get '/trips/:id/edit' do
    @station_names = StationName.all.order(:name)
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  put '/trips/:id' do
    utf = UpdateTripForm.new(params)
    if utf.save
      redirect "/trips/#{params[:id]}"
    else
      @errors = utf.errors
      @station_names = StationName.all.order(:name)
      @trip = Trip.find(params[:id])
      erb :"/trips/edit"
    end
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect '/trips'
  end

  get '/conditions' do
    @conditions = Weather.paginate(page: params[:page], per_page: 30)
    erb :"conditions/index"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  get '/conditions/:id/edit' do
    @condition = Weather.find(params[:id])
    erb :"conditions/edit"
  end

  put '/conditions/:id' do
    ucf = UpdateConditionForm.new(params)
    if ucf.save
      redirect "/conditions/#{params[:id]}"
    else
      @errors = ucf.errors
      @condition = Weather.find(params[:id])
      erb :"/conditions/edit"
    end
  end

  delete '/conditions/:id' do |id|
    Weather.destroy(id.to_i)
    redirect '/conditions'
  end

  get '/conditions/:id' do
    @condition = Weather.find(params[:id])
    erb :"conditions/show"
  end

  post '/conditions/new' do
    cf = ConditionForm.new(params[:weather])
      if cf.save
        redirect '/conditions'
      else
        @errors = cf.errors
        erb :"/conditions/new"
      end
    end

  def execute_statement(sql)
     results = ActiveRecord::Base.connection.execute(sql)
     if results.present?
         return results
     else
         return nil
     end
  end
end
