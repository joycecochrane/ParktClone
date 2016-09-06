require 'test_helper'

class MetersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
   assert_response :success
  end



  #tests
  test "test meter parse" do
    @controller.parse_kml
  end

  # test "test filter meters" do
  #   location = Location.new(lat: 50.2, lon: 34.3, User_id: "jh1kj23" )
  #   @controller.filter_meters(50, location)
  # end

  test "test parse meter variables" do
    Meter.destroy_all
    @controller.parse_kml

    first_meter = Meter.first
    assert first_meter.timeLimit == 2, "time limit old not saved"
    assert first_meter.meterHeadType == "Single", "meterHeadType not saved"
    assert first_meter.rate == 3.0, "rate not saved"
    assert first_meter.payByPhoneNumber == 65192, "payByPhoneNumber not saved"
    assert first_meter.timeInEffect == "9:00 AM TO 10:00 PM", "timeInEffect not saved"
    assert first_meter.lat == 49.2834540339571, "lat not saved"
    assert first_meter.lon == -123.106670480264, "lon not saved"
  end



end
