require 'test_helper'

class NetworkDataControllerTest < ActionController::TestCase
  setup do
    @network_datum = network_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_datum" do
    assert_difference('NetworkDatum.count') do
      post :create, network_datum: { day: @network_datum.day, received: @network_datum.received, sent: @network_datum.sent }
    end

    assert_redirected_to network_datum_path(assigns(:network_datum))
  end

  test "should show network_datum" do
    get :show, id: @network_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @network_datum
    assert_response :success
  end

  test "should update network_datum" do
    put :update, id: @network_datum, network_datum: { day: @network_datum.day, received: @network_datum.received, sent: @network_datum.sent }
    assert_redirected_to network_datum_path(assigns(:network_datum))
  end

  test "should destroy network_datum" do
    assert_difference('NetworkDatum.count', -1) do
      delete :destroy, id: @network_datum
    end

    assert_redirected_to network_data_path
  end
end
