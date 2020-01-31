require 'test_helper'

class AdminUsers::ManageInventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_inventories_index_url
    assert_response :success
  end

end
