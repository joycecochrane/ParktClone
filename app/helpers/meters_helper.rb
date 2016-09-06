module MetersHelper
  KML_FILE_PATH = Rails.root.join "meterData", "meterData.kml"
  
  def kml_exists?
    File.exists?( KML_FILE_PATH )
  end

  def kml_last_modified
    File.mtime( KML_FILE_PATH )
  end

  def kml_message
    message = "There is currently no kml file saved to the server"
    if kml_exists?
    message = "The KML file was last refreshed on: " + kml_last_modified.to_s
    end
    return message
  end

  def meters_message
      message = "The meters database contains " + Meter.count.to_s + " entries."
      return message
  end


end
