require "test_helper"

class Public::CropsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_crops_new_url
    assert_response :success
  end

  test "should get index" do
    get public_crops_index_url
    assert_response :success
  end

  test "should get show" do
    get public_crops_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_crops_edit_url
    assert_response :success
  end
end
