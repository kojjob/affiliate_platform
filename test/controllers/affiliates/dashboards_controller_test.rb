require "test_helper"

class Affiliates::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get affiliates_dashboards_index_url
    assert_response :success
  end
end
