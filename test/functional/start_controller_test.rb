require 'test_helper'

class StartControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get ranking" do
    get :ranking
    assert_response :success
  end

  test "should get table" do
    get :table
    assert_response :success
  end

  test "should get scorer" do
    get :scorer
    assert_response :success
  end

end
