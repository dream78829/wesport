require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  setup do
    @record = records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create record" do
    assert_difference('Record.count') do
      post :create, record: { assist: @record.assist, block: @record.block, defensive_rebound: @record.defensive_rebound, efficiency_formula: @record.efficiency_formula, free_throw_made: @record.free_throw_made, free_throw_miss: @record.free_throw_miss, free_throw_total: @record.free_throw_total, game_id: @record.game_id, offensive_rebound: @record.offensive_rebound, personal_foul: @record.personal_foul, player_id: @record.player_id, points_total: @record.points_total, rebound_total: @record.rebound_total, steal: @record.steal, three_points_made: @record.three_points_made, three_points_miss: @record.three_points_miss, three_points_total: @record.three_points_total, turn_over: @record.turn_over, two_points_made: @record.two_points_made, two_points_made: @record.two_points_made, two_points_total: @record.two_points_total }
    end

    assert_redirected_to record_path(assigns(:record))
  end

  test "should show record" do
    get :show, id: @record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @record
    assert_response :success
  end

  test "should update record" do
    put :update, id: @record, record: { assist: @record.assist, block: @record.block, defensive_rebound: @record.defensive_rebound, efficiency_formula: @record.efficiency_formula, free_throw_made: @record.free_throw_made, free_throw_miss: @record.free_throw_miss, free_throw_total: @record.free_throw_total, game_id: @record.game_id, offensive_rebound: @record.offensive_rebound, personal_foul: @record.personal_foul, player_id: @record.player_id, points_total: @record.points_total, rebound_total: @record.rebound_total, steal: @record.steal, three_points_made: @record.three_points_made, three_points_miss: @record.three_points_miss, three_points_total: @record.three_points_total, turn_over: @record.turn_over, two_points_made: @record.two_points_made, two_points_made: @record.two_points_made, two_points_total: @record.two_points_total }
    assert_redirected_to record_path(assigns(:record))
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete :destroy, id: @record
    end

    assert_redirected_to records_path
  end
end
