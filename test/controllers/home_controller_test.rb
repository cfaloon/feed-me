require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get stream" do
    get home_stream_url
    assert_response :success
  end

end
