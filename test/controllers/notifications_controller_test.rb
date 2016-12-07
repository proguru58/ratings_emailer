require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get track_email_open" do
    get notifications_track_email_open_url
    assert_response :success
  end

end
