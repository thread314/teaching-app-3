require 'test_helper'

class CardstatesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get cardstates_edit_url
    assert_response :success
  end

end
