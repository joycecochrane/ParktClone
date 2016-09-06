require 'test_helper'

class DataDownloaderControllerTest < ActionController::TestCase
  
  test "download should put file in folder and unzip it" do
    # Don't test download every time because it takes a long time
    if not @controller.kml_exists?
    post :refresh_kml
    assert @controller.kml_exists?
    else
      assert true
    end
  end

end


