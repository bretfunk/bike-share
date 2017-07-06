require 'will_paginate'
require 'will_paginate/active_record'

class Weather < ActiveRecord::Base
  belongs_to :bike_share_date, foreign_key: :date_id
  belongs_to :zip_code

  def date
    bike_share_date.bike_share_date.to_s[0..9]
  end

   def zip
     zip_code.zip_code.to_i
   end
end
