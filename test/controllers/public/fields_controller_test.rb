require "test_helper"

class Public::FieldsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_fields_new_url
    assert_response :success
  end

  test "should get index" do
    get public_fields_index_url
    assert_response :success
  end

  test "should get show" do
    get public_fields_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_fields_edit_url
    assert_response :success
  end
end
