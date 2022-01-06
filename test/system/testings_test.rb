require "application_system_test_case"

class TestingsTest < ApplicationSystemTestCase
  setup do
    @testing = testings(:one)
  end

  test "visiting the index" do
    visit testings_url
    assert_selector "h1", text: "Testings"
  end

  test "should create testing" do
    visit testings_url
    click_on "New testing"

    fill_in "Title", with: @testing.title
    click_on "Create Testing"

    assert_text "Testing was successfully created"
    click_on "Back"
  end

  test "should update Testing" do
    visit testing_url(@testing)
    click_on "Edit this testing", match: :first

    fill_in "Title", with: @testing.title
    click_on "Update Testing"

    assert_text "Testing was successfully updated"
    click_on "Back"
  end

  test "should destroy Testing" do
    visit testing_url(@testing)
    click_on "Destroy this testing", match: :first

    assert_text "Testing was successfully destroyed"
  end
end
