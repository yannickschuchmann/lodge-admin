require 'test_helper'

class ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get content_start_url
    assert_response :success
  end

end
