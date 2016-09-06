class Location < ActiveRecord::Base
   

  attr_accessor :RADIUS_OF_EARTH, :CONVERSION_RATIO

  RADIUS_OF_EARTH = 6371
  CONVERSION_RATIO = Math::PI/180

  def self.get_distance_between_in_km(lat1, lon1, lat2, lon2)
    d_lat = Location.deg2rad(lat2-lat1) # deg2rad below
    d_lon = Location.deg2rad(lon2-lon1)
    half_d_lat = d_lat / 2
    half_d_lon = d_lon / 2

    a = Math.sin(half_d_lat) * Math.sin(half_d_lat) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
                Math.sin(half_d_lon) * Math.sin(half_d_lon)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    d = RADIUS_OF_EARTH * c # Distance in km
    return d
  end

  def self.deg2rad(deg) 
    return deg * (CONVERSION_RATIO)
  end

   
end
