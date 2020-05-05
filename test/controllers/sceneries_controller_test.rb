require 'test_helper'

class SceneriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sceneries_path
    assert_response :success
  end

end