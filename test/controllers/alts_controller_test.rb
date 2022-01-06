require "test_helper"

class AltsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alt = alts(:one)
  end

  test "should get index" do
    get alts_url
    assert_response :success
  end

  test "should get new" do
    get new_alt_url
    assert_response :success
  end

  test "should create alt" do
    assert_difference("Alt.count") do
      post alts_url, params: { alt: { image_data: @alt.image_data, original_source: @alt.original_source, original_url: @alt.original_url, title: @alt.title, user_id: @alt.user_id, verified: @alt.verified } }
    end

    assert_redirected_to alt_url(Alt.last)
  end

  test "should show alt" do
    get alt_url(@alt)
    assert_response :success
  end

  test "should get edit" do
    get edit_alt_url(@alt)
    assert_response :success
  end

  test "should update alt" do
    patch alt_url(@alt), params: { alt: { image_data: @alt.image_data, original_source: @alt.original_source, original_url: @alt.original_url, title: @alt.title, user_id: @alt.user_id, verified: @alt.verified } }
    assert_redirected_to alt_url(@alt)
  end

  test "should destroy alt" do
    assert_difference("Alt.count", -1) do
      delete alt_url(@alt)
    end

    assert_redirected_to alts_url
  end
end
