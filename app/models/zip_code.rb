class ZipCode < ActiveRecord::Base
  has_many :trips
  has_many :weathers
end
