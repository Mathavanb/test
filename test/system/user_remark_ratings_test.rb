require "application_system_test_case"

class UserRemarkRatingsTest < ApplicationSystemTestCase
  setup do
    @user_remark_rating = user_remark_ratings(:one)
  end

  test "visiting the index" do
    visit user_remark_ratings_url
    assert_selector "h1", text: "User Remark Ratings"
  end

  test "creating a User remark rating" do
    visit user_remark_ratings_url
    click_on "New User Remark Rating"

    fill_in "Rate", with: @user_remark_rating.rate
    fill_in "Remark", with: @user_remark_rating.remark_id
    fill_in "User", with: @user_remark_rating.user_id
    click_on "Create User remark rating"

    assert_text "User remark rating was successfully created"
    click_on "Back"
  end

  test "updating a User remark rating" do
    visit user_remark_ratings_url
    click_on "Edit", match: :first

    fill_in "Rate", with: @user_remark_rating.rate
    fill_in "Remark", with: @user_remark_rating.remark_id
    fill_in "User", with: @user_remark_rating.user_id
    click_on "Update User remark rating"

    assert_text "User remark rating was successfully updated"
    click_on "Back"
  end

  test "destroying a User remark rating" do
    visit user_remark_ratings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User remark rating was successfully destroyed"
  end
end
