# 
require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  belongs_to :start_station, class_name: :Station, foreign_key: :start_station_id
  belongs_to :end_station, class_name: :Station, foreign_key: :end_station_id
  belongs_to :start_station_name, class_name: :StationName, foreign_key: :start_station_name_id
  belongs_to :end_station_name, class_name: :StationName, foreign_key: :end_station_name_id
  belongs_to :subscription_type
  belongs_to :zip_code
  belongs_to :start_bike_share_date, class_name: :BikeShareDate, foreign_key: :start_date_id
  belongs_to :end_bike_share_date, class_name: :BikeShareDate, foreign_key: :end_date_id

  def start_date
    BikeShareDate.find(start_date_id).bike_share_date
  end

  def start_station_name
    StationName.find(start_station_name_id).name
  end

  def end_date
    BikeShareDate.find(end_date_id).bike_share_date
  end

  def end_station_name
    StationName.find(end_station_name_id).name
  end

  def subscription_type
    SubscriptionType.find(subscription_type_id).name
  end

  def zip_code
    ZipCode.find(zip_code_id).zip_code
  end

  def self.average_duration_of_a_ride
    Trip.average(:duration).to_i
  end

  def self.longest_ride
    Trip.order(:duration).last.duration
  end

  def self.shortest_ride
    Trip.order(:duration).first.duration
  end
  def self.most_starting_station_rides
    StationName.find(Trip.group(:start_station_name_id).order("count_id asc").count(:id).keys.last).name
  end

  def self.most_ending_station_rides
    StationName.find(Trip.group(:start_station_name_id).order("count_id desc").count(:id).keys.last).name
  end

  def self.month_by_month_breakdown
      #Month by Month breakdown of number of rides with subtotals for each year
  end

  def self.least_ridden_bike
    Trip.group(:bike_id).order("count_id desc").count(:id).keys.last
  end

  def self.least_ridden_bike_number
    Trip.group(:bike_id).order("count_id desc").count(:id).values.last
  end

  def self.most_ridden_bike
    Trip.group(:bike_id).order("count_id asc").count(:id).keys.last
  end

  def self.most_ridden_bike_number
    Trip.group(:bike_id).order("count_id asc").count(:id).values.last
  end

  def self.user_subscription_count
    Trip.where(subscription_type_id: 1).count
  end

  def self.user_subscription_percentage
    ((user_subscription_count.to_f / Trip.all.count.to_f) * 100).round
  end

  def self.day_of_highest_trips
    BikeShareDate.find(Trip.group(:start_date_id).order("count_id asc").count(:id).keys.last).bike_share_date
  end

  def self.day_of_lowest_trips
    BikeShareDate.find(Trip.group(:start_date_id).order("count_id asc").count(:id).keys.first).bike_share_date
  end

  def self.day_of_highest_trips_number
    Trip.group(:start_date_id).order("count_id asc").count(:id).values.last
  end

  def self.day_of_lowest_trips_number
    Trip.group(:start_date_id).order("count_id asc").count(:id).values.first
  end
end
