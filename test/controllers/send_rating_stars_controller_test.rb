require 'test_helper'

class SendRatingStarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get send_rating_stars_index_url
    assert_response :success
  end

end
