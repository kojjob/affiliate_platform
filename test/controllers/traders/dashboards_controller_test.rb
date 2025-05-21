require "test_helper"

class Traders::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get traders_dashboards_index_url
    assert_response :success
  end
end
