require "test_helper"

class AdressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get adresses_edit_url
    assert_response :success
  end
end
