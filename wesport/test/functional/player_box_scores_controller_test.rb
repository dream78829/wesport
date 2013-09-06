require 'test_helper'

class PlayerBoxScoresControllerTest < ActionController::TestCase
  setup do
    @player_box_score = player_box_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_box_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_box_score" do
    assert_difference('PlayerBoxScore.count') do
      post :create, player_box_score: {  }
    end

    assert_redirected_to player_box_score_path(assigns(:player_box_score))
  end

  test "should show player_box_score" do
    get :show, id: @player_box_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_box_score
    assert_response :success
  end

  test "should update player_box_score" do
    put :update, id: @player_box_score, player_box_score: {  }
    assert_redirected_to player_box_score_path(assigns(:player_box_score))
  end

  test "should destroy player_box_score" do
    assert_difference('PlayerBoxScore.count', -1) do
      delete :destroy, id: @player_box_score
    end

    assert_redirected_to player_box_scores_path
  end
end
