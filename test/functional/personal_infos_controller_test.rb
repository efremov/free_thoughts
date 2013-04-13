require 'test_helper'

class PersonalInfosControllerTest < ActionController::TestCase
  setup do
    @personal_info = personal_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_info" do
    assert_difference('PersonalInfo.count') do
      post :create, personal_info: { age: @personal_info.age, country: @personal_info.country, credo: @personal_info.credo, gender: @personal_info.gender, image: @personal_info.image, marital_status: @personal_info.marital_status, name: @personal_info.name, political_views: @personal_info.political_views, religion: @personal_info.religion, smf_more: @personal_info.smf_more, surname: @personal_info.surname }
    end

    assert_redirected_to personal_info_path(assigns(:personal_info))
  end

  test "should show personal_info" do
    get :show, id: @personal_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_info
    assert_response :success
  end

  test "should update personal_info" do
    put :update, id: @personal_info, personal_info: { age: @personal_info.age, country: @personal_info.country, credo: @personal_info.credo, gender: @personal_info.gender, image: @personal_info.image, marital_status: @personal_info.marital_status, name: @personal_info.name, political_views: @personal_info.political_views, religion: @personal_info.religion, smf_more: @personal_info.smf_more, surname: @personal_info.surname }
    assert_redirected_to personal_info_path(assigns(:personal_info))
  end

  test "should destroy personal_info" do
    assert_difference('PersonalInfo.count', -1) do
      delete :destroy, id: @personal_info
    end

    assert_redirected_to personal_infos_path
  end
end
