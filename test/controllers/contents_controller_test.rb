require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contents_path
    assert_response :success
  end

end
