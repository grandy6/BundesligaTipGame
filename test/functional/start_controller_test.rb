require 'test_helper'

class StartControllerTest < ActionController::TestCase
  test "should get team" do
    get :team
    assert_response :success
  end

end
