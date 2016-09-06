class Meter < ActiveRecord::Base

  def meter_params
    params.require(:lat, :lon)
  end

end
