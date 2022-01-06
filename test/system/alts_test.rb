require "application_system_test_case"

class AltsTest < ApplicationSystemTestCase
  setup do
    @alt = alts(:one)
  end

  test "visiting the index" do
    visit alts_url
    assert_selector "h1", text: "Alts"
  end

  test "should create alt" do
    visit alts_url
    click_on "New alt"

    fill_in "Image data", with: @alt.image_data
    fill_in "Original source", with: @alt.original_source
    fill_in "Original url", with: @alt.original_url
    fill_in "Title", with: @alt.title
    fill_in "User", with: @alt.user_id
    check "Verified" if @alt.verified
    click_on "Create Alt"

    assert_text "Alt was successfully created"
    click_on "Back"
  end

  test "should update Alt" do
    visit alt_url(@alt)
    click_on "Edit this alt", match: :first

    fill_in "Image data", with: @alt.image_data
    fill_in "Original source", with: @alt.original_source
    fill_in "Original url", with: @alt.original_url
    fill_in "Title", with: @alt.title
    fill_in "User", with: @alt.user_id
    check "Verified" if @alt.verified
    click_on "Update Alt"

    assert_text "Alt was successfully updated"
    click_on "Back"
  end

  test "should destroy Alt" do
    visit alt_url(@alt)
    click_on "Destroy this alt", match: :first

    assert_text "Alt was successfully destroyed"
  end
end
