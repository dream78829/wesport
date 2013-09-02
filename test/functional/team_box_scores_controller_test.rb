require 'test_helper'

class TeamBoxScoresControllerTest < ActionController::TestCase
  setup do
    @team_box_score = team_box_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_box_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_box_score" do
    assert_difference('TeamBoxScore.count') do
      post :create, team_box_score: {  }
    end

    assert_redirected_to team_box_score_path(assigns(:team_box_score))
  end

  test "should show team_box_score" do
    get :show, id: @team_box_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_box_score
    assert_response :success
  end

  test "should update team_box_score" do
    put :update, id: @team_box_score, team_box_score: {  }
    assert_redirected_to team_box_score_path(assigns(:team_box_score))
  end

  test "should destroy team_box_score" do
    assert_difference('TeamBoxScore.count', -1) do
      delete :destroy, id: @team_box_score
    end

    assert_redirected_to team_box_scores_path
  end
end
