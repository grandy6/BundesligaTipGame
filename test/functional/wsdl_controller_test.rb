require 'test_helper'

class WsdlControllerTest < ActionController::TestCase
  test "should get update_and_evaluate" do
    get :update_and_evaluate
    assert_response :success
  end

end
