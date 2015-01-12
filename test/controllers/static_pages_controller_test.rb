require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get artist" do
    get :artist
    assert_response :success
  end

  test "should get songs" do
    get :songs
    assert_response :success
  end

  test "should get genres" do
    get :genres
    assert_response :success
  end

  test "should get hotttness" do
    get :hotttness
    assert_response :success
  end

  test "should get price" do
    get :price
    assert_response :success
  end

end
