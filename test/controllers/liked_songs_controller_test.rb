require "test_helper"

class LikedSongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liked_song = liked_songs(:one)
  end

  test "should get index" do
    get liked_songs_url, as: :json
    assert_response :success
  end

  test "should create liked_song" do
    assert_difference('LikedSong.count') do
      post liked_songs_url, params: { liked_song: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show liked_song" do
    get liked_song_url(@liked_song), as: :json
    assert_response :success
  end

  test "should update liked_song" do
    patch liked_song_url(@liked_song), params: { liked_song: {  } }, as: :json
    assert_response 200
  end

  test "should destroy liked_song" do
    assert_difference('LikedSong.count', -1) do
      delete liked_song_url(@liked_song), as: :json
    end

    assert_response 204
  end
end
