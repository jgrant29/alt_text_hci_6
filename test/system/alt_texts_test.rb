require "application_system_test_case"

class AltTextsTest < ApplicationSystemTestCase
  setup do
    @alt_text = alt_texts(:one)
  end

  test "visiting the index" do
    visit alt_texts_url
    assert_selector "h1", text: "Alt texts"
  end

  test "should create alt text" do
    visit alt_texts_url
    click_on "New alt text"

    fill_in "Alt", with: @alt_text.alt_id
    fill_in "Body", with: @alt_text.body
    fill_in "User", with: @alt_text.user_id
    click_on "Create Alt text"

    assert_text "Alt text was successfully created"
    click_on "Back"
  end

  test "should update Alt text" do
    visit alt_text_url(@alt_text)
    click_on "Edit this alt text", match: :first

    fill_in "Alt", with: @alt_text.alt_id
    fill_in "Body", with: @alt_text.body
    fill_in "User", with: @alt_text.user_id
    click_on "Update Alt text"

    assert_text "Alt text was successfully updated"
    click_on "Back"
  end

  test "should destroy Alt text" do
    visit alt_text_url(@alt_text)
    click_on "Destroy this alt text", match: :first

    assert_text "Alt text was successfully destroyed"
  end
end
