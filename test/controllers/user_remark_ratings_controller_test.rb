require "test_helper"

class UserRemarkRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_remark_rating = user_remark_ratings(:one)
  end

  test "should get index" do
    get user_remark_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_user_remark_rating_url
    assert_response :success
  end

  test "should create user_remark_rating" do
    assert_difference('UserRemarkRating.count') do
      post user_remark_ratings_url, params: { user_remark_rating: { rate: @user_remark_rating.rate, remark_id: @user_remark_rating.remark_id, user_id: @user_remark_rating.user_id } }
    end

    assert_redirected_to user_remark_rating_url(UserRemarkRating.last)
  end

  test "should show user_remark_rating" do
    get user_remark_rating_url(@user_remark_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_remark_rating_url(@user_remark_rating)
    assert_response :success
  end

  test "should update user_remark_rating" do
    patch user_remark_rating_url(@user_remark_rating), params: { user_remark_rating: { rate: @user_remark_rating.rate, remark_id: @user_remark_rating.remark_id, user_id: @user_remark_rating.user_id } }
    assert_redirected_to user_remark_rating_url(@user_remark_rating)
  end

  test "should destroy user_remark_rating" do
    assert_difference('UserRemarkRating.count', -1) do
      delete user_remark_rating_url(@user_remark_rating)
    end

    assert_redirected_to user_remark_ratings_url
  end
end
