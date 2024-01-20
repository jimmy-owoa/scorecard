require "test_helper"

class ScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score = scores(:one)
  end

  test "should get index" do
    get scores_url
    assert_response :success
  end

  test "should get new" do
    get new_score_url
    assert_response :success
  end

  test "should create score" do
    assert_difference("Score.count") do
      post scores_url, params: { score: { game_id: @score.game_id, hole_id: @score.hole_id, net: @score.net, player_id: @score.player_id, points: @score.points, strokes: @score.strokes } }
    end

    assert_redirected_to score_url(Score.last)
  end

  test "should show score" do
    get score_url(@score)
    assert_response :success
  end

  test "should get edit" do
    get edit_score_url(@score)
    assert_response :success
  end

  test "should update score" do
    patch score_url(@score), params: { score: { game_id: @score.game_id, hole_id: @score.hole_id, net: @score.net, player_id: @score.player_id, points: @score.points, strokes: @score.strokes } }
    assert_redirected_to score_url(@score)
  end

  test "should destroy score" do
    assert_difference("Score.count", -1) do
      delete score_url(@score)
    end

    assert_redirected_to scores_url
  end
end
