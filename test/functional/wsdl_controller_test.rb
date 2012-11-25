require 'test_helper'

class WsdlControllerTest < ActionController::TestCase
  test "should get get_all_for_new_saison" do
    get :get_all_for_new_saison
    assert_response :success
  end

end
