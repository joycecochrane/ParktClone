class MetersController < ApplicationController
  KML_FILE_PATH = Rails.root.join "meterData", "meterData.kml"
  #for testing
  #KML_FILE_PATH = Rails.root.join "meterData", "sampleMeterData.kml"
  def new
  end

  def index
  end

  def parse_kml
  f = File.open(KML_FILE_PATH)
  doc = Nokogiri::XML(f)
  f.close
  placemarks = doc.css('Placemark')

  placemarks.each do |pm|
    #create a new meter and assign values to the variables before saving to database
    @meter = Meter.new #.create: returns a new model and saves it to db

    #parse coordinates only if the placemarker has them
    if pm.css('coordinates')[0] != nil

      # if pm.css('name').text != nil
      #   name_txt = pm.css('name').text.to_i
      #   @meter.nameId = name_txt
      # end

      if pm.css('description')[0] != nil
        text = pm.css('description')[0].to_str
        #parse the description text
        parse_description(text, @meter)
      end

      coord_txt = pm.css('coordinates')[0].to_str
      parse_coordinates(coord_txt, @meter)

    end

    @meter.save

  end
  end

  #a method to parse the information from the description
  def parse_description(text, meter)

    text = text.split("<br>") #need to check the data document we actually use!

    #taking the split string and extracting the value
    #text[0] should be empty
    meter_type = text[1].split(":")[1].strip  #string

    time_limit = text[2].split(":")[1].strip.split(" ")[0].to_i #integer

    rate = text[3].split(":")[1].strip.delete('$').strip.to_f #float

    #skipping 4 because we don't care about credit card stuff

    meter_split = text[5].split(":")
    if meter_split.length == 5
      meter_in_effect = meter_split[2] + ":" + meter_split[3] + ":" + meter_split[4]
      meter_in_effect.strip!
    end

    if meter_split.length == 2
      meter_in_effect = meter_split[1].strip
    end

    pay_by_phone = text[6].split(":")[1].strip.to_i

    #assign the parsed variables to the meter object
    #@meter.update_attributes(:meterHeadType => meter_type)
    @meter.meterHeadType = meter_type
    @meter.timeLimit = time_limit
    #@meter.update_attributes(:timeLimit => time_limit)
    @meter.rate = rate
    @meter.timeInEffect = meter_in_effect #this warning is okay
    @meter.payByPhoneNumber = pay_by_phone
  end

  def parse_coordinates(text, meter)
    lat = text.split(",")[1].to_f
    lon = text.split(",")[0].to_f

    #assign lat lon to meter
    @meter.lat = lat
    @meter.lon = lon
  end


  # This empties the database, so it should only be called when
  # the kml file exists
  def reload_data
    log_str = "Problem Parsing KML File"
    if File.exists?( KML_FILE_PATH )
      Meter.destroy_all # Note this doesn't reset ID
      parse_kml
      log_str =  "Parsed KML File, " + Meter.count.to_s + " meters added"
      puts log_str # log for heroku
      Rails.logger.debug log_str # also log while developing
    end
    redirect_to action: "index"
  end

  # Filter parsed meters by Minimum Hours
  def filter_by_hours
    meters = Meter.all
    filtered_meters = []
    min_hours = get_from_slider

    meters.each do |m|
      if m.timeLimit >= min_hours
        filtered_meters << m
      end
    end

    return filtered_meters
  end


  # Filter parsed meters by type of parking spot
  def filter_by_rate
    meters = Meter.all
    filtered_meters = []
    rate = get_from_slider

    meters.each do |m|
      if m.rate <= rate
        filtered_meters << m
      end
    end

    return filtered_meters
  end
  
  # returns a list of meters included in the radius setting
  def filter_meters()
    meter_list = Meter.all #may not do this
    meters = []
    
    @currentLocation = Location.last

    if @currentLocation == nil
      loc = Location.new
      loc.lat = 49.2496600	
      loc.lon = -123.1193400 
      @currentLocation = loc
    end
    
    current_lat = @currentLocation.lat
    current_lon = @currentLocation.lon

    meter_list.each do |m|
     m_lat = m.lat
     m_lon = m.lon

     if m_lat != nil && m_lon != nil
      distance = Location.get_distance_between_in_km(current_lat, current_lon, m_lat, m_lon)
      if distance <= 0.4
        meters.push(m)
      end
     end

    end

    return meters

  end
    
  def locations
      @parking_meters = filter_meters()
      render "locations.json", collection: @parking_meters
  end


end


