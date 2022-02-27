require "application_system_test_case"

class AbsencesTest < ApplicationSystemTestCase
  setup do
    @absence = absences(:one)
  end

  test "visiting the index" do
    visit absences_url
    assert_selector "h1", text: "Absences"
  end

  test "should create absence" do
    visit absences_url
    click_on "New absence"

    fill_in "Absence type", with: @absence.absence_type_id
    fill_in "Description", with: @absence.description
    fill_in "End time", with: @absence.end_time
    fill_in "Name", with: @absence.name
    fill_in "Start time", with: @absence.start_time
    fill_in "User", with: @absence.user_id
    click_on "Create Absence"

    assert_text "Absence was successfully created"
    click_on "Back"
  end

  test "should update Absence" do
    visit absence_url(@absence)
    click_on "Edit this absence", match: :first

    fill_in "Absence type", with: @absence.absence_type_id
    fill_in "Description", with: @absence.description
    fill_in "End time", with: @absence.end_time
    fill_in "Name", with: @absence.name
    fill_in "Start time", with: @absence.start_time
    fill_in "User", with: @absence.user_id
    click_on "Update Absence"

    assert_text "Absence was successfully updated"
    click_on "Back"
  end

  test "should destroy Absence" do
    visit absence_url(@absence)
    click_on "Destroy this absence", match: :first

    assert_text "Absence was successfully destroyed"
  end
end
