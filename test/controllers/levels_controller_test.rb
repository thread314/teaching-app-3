require 'test_helper'

class LevelsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get levels_edit_url
    assert_response :success
  end

end
