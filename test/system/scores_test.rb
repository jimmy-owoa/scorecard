require "application_system_test_case"

class ScoresTest < ApplicationSystemTestCase
  setup do
    @score = scores(:one)
  end

  test "visiting the index" do
    visit scores_url
    assert_selector "h1", text: "Scores"
  end

  test "should create score" do
    visit scores_url
    click_on "New score"

    fill_in "Game", with: @score.game_id
    fill_in "Hole", with: @score.hole_id
    fill_in "Net", with: @score.net
    fill_in "Player", with: @score.player_id
    fill_in "Points", with: @score.points
    fill_in "Strokes", with: @score.strokes
    click_on "Create Score"

    assert_text "Score was successfully created"
    click_on "Back"
  end

  test "should update Score" do
    visit score_url(@score)
    click_on "Edit this score", match: :first

    fill_in "Game", with: @score.game_id
    fill_in "Hole", with: @score.hole_id
    fill_in "Net", with: @score.net
    fill_in "Player", with: @score.player_id
    fill_in "Points", with: @score.points
    fill_in "Strokes", with: @score.strokes
    click_on "Update Score"

    assert_text "Score was successfully updated"
    click_on "Back"
  end

  test "should destroy Score" do
    visit score_url(@score)
    click_on "Destroy this score", match: :first

    assert_text "Score was successfully destroyed"
  end
end
