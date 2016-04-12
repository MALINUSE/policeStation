class VehicleFound < ActiveRecord::Base
  belongs_to :station_police
  belongs_to :engin
end
