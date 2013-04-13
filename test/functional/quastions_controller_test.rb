require 'test_helper'

class QuastionsControllerTest < ActionController::TestCase
  setup do
    @quastion = quastions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quastions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quastion" do
    assert_difference('Quastion.count') do
      post :create, quastion: { discription: @quastion.discription, image: @quastion.image, rate: @quastion.rate, topic: @quastion.topic }
    end

    assert_redirected_to quastion_path(assigns(:quastion))
  end

  test "should show quastion" do
    get :show, id: @quastion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quastion
    assert_response :success
  end

  test "should update quastion" do
    put :update, id: @quastion, quastion: { discription: @quastion.discription, image: @quastion.image, rate: @quastion.rate, topic: @quastion.topic }
    assert_redirected_to quastion_path(assigns(:quastion))
  end

  test "should destroy quastion" do
    assert_difference('Quastion.count', -1) do
      delete :destroy, id: @quastion
    end

    assert_redirected_to quastions_path
  end
end
