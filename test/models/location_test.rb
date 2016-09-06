require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "ZeroDistance" do
    assert_equal(0, Location.get_distance_between_in_km(1, 1, 1, 1))
  end

  test "SomeDistance" do
    result = Location.get_distance_between_in_km(1, 2, 3, 4)
    difference = 314.4 - result
    abs_difference = difference.abs
    if abs_difference < 0.1
      assert_equal(true, true)

    else
      puts result
      puts difference
      puts abs_difference
      assert_equal(true, false)
    end
  end

  test "NegativeCoords" do
    result1 = Location.get_distance_between_in_km(-1, -2, -3, -4)
    result2 = Location.get_distance_between_in_km(1, 2, 3, 4)
    result3 = Location.get_distance_between_in_km(-1, 2, -3, 4)
    result4 = Location.get_distance_between_in_km(1, -2, 3, -4)

    assert_equal(result1, result2)
    assert_equal(result2, result3)
    assert_equal(result3, result4)
  end

end
