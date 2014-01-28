require 'test_helper'

class DiceControllerTest < ActionController::TestCase
  test "should get dice" do
    get :dice
    assert_response :success
  end

  test "should get play" do
    get :play
    assert_response :success
  end

end
