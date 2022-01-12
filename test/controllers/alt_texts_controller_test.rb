require "test_helper"

class AltTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alt_text = alt_texts(:one)
  end

  test "should get index" do
    get alt_texts_url
    assert_response :success
  end

  test "should get new" do
    get new_alt_text_url
    assert_response :success
  end

  test "should create alt_text" do
    assert_difference("AltText.count") do
      post alt_texts_url, params: { alt_text: { alt_id: @alt_text.alt_id, body: @alt_text.body, user_id: @alt_text.user_id } }
    end

    assert_redirected_to alt_text_url(AltText.last)
  end

  test "should show alt_text" do
    get alt_text_url(@alt_text)
    assert_response :success
  end

  test "should get edit" do
    get edit_alt_text_url(@alt_text)
    assert_response :success
  end

  test "should update alt_text" do
    patch alt_text_url(@alt_text), params: { alt_text: { alt_id: @alt_text.alt_id, body: @alt_text.body, user_id: @alt_text.user_id } }
    assert_redirected_to alt_text_url(@alt_text)
  end

  test "should destroy alt_text" do
    assert_difference("AltText.count", -1) do
      delete alt_text_url(@alt_text)
    end

    assert_redirected_to alt_texts_url
  end
end
