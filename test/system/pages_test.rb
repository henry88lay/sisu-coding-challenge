require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "My Favourite Films"
  end

  test "the summary and calculations are correctly displayed on view" do
    visit "/"
    assert_selector "h3", text:"Henry's Favourite Films Average Score: 8.53"
    assert_selector "h3", text:"Average Adventure Genre Score: 8.5"
  end
end
