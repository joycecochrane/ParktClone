require 'zip'

class DataDownloaderController < ApplicationController
  VAN_OPEN_DATA_URL =  "data.vancouver.ca"
  METER_URL_PATH = "/download/kml/parking_meter_rates_and_time_limits.kmz"
  KML_FILE_PATH = Rails.root.join "meterData", "meterData.kml"
  KMZ_FILE_PATH = Rails.root.join "meterData", "meterData.kmz"

  # TODO some sort of admin page to actually run this
  # TODO try more than once and follow redirects if something is wrong with the download
  # TODO (maybe) do some sort of time stamp checking to avoid doing this too often
  
  def kml_exists?
    File.exists?( KML_FILE_PATH )
  end

  def delete_kml
    if kml_exists?
      File.delete( KML_FILE_PATH )
    end
  end

  def kml_last_modified
    File.mtime( KML_FILE_PATH )
  end

  def download_kmz
    Net::HTTP.start( VAN_OPEN_DATA_URL ) do |http|
      resp = http.get( METER_URL_PATH )
      open(KMZ_FILE_PATH, "wb") do |file|
        file.write(resp.body)
      end
    end
  end

  def kmz_exists?
    File.exists?( KMZ_FILE_PATH )
  end

  def unzip_kmz
    if kmz_exists? 
      Zip::File.open(KMZ_FILE_PATH) do |kmz_file|
        kml_entry = kmz_file.glob('*.kml').first
        kml_entry.extract( KML_FILE_PATH )
      end
    end
  end

  def delete_kmz
    if kmz_exists?
      File.delete(KMZ_FILE_PATH)
    end
  end
  
  # This method will update the kml file from Vancouver open data
  # and delete the old one and the kmz once things are working
  def refresh_kml
    delete_kml
    delete_kmz
    download_kmz
    unzip_kmz
    delete_kmz
    # Write to log - should be accessible in heroku logs
    if (kml_exists?) 
      puts "Successfuly Refreshed KML!"
    else
      puts "Something went wrong with refreshing the KML, no file exists"
    end
    redirect_to url_for( :controller => :meters, :action => :index  )
  end

  def data_file
  end


end
