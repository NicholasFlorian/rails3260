require "application_system_test_case"

class DiesTest < ApplicationSystemTestCase
  setup do
    @dy = dies(:one)
  end

  test "visiting the index" do
    visit dies_url
    assert_selector "h1", text: "Dies"
  end

  test "creating a Die" do
    visit dies_url
    click_on "New Die"

    fill_in "Colour", with: @dy.colour
    fill_in "Fk user", with: @dy.fk_user_id
    fill_in "Sides", with: @dy.sides
    click_on "Create Die"

    assert_text "Die was successfully created"
    click_on "Back"
  end

  test "updating a Die" do
    visit dies_url
    click_on "Edit", match: :first

    fill_in "Colour", with: @dy.colour
    fill_in "Fk user", with: @dy.fk_user_id
    fill_in "Sides", with: @dy.sides
    click_on "Update Die"

    assert_text "Die was successfully updated"
    click_on "Back"
  end

  test "destroying a Die" do
    visit dies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Die was successfully destroyed"
  end
end
