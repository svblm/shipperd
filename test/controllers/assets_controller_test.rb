require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  setup do
    @asset = assets(:asset)
  end

  test "should get index" do
    get :index, project_id: projects(:lean).id

    assert_response :success
    assert_not_nil assigns(:assets)
  end

  test "should get new" do
    get :new, project_id: projects(:lean).id
    assert_response :success
  end

  test "should create asset" do
    assert_difference('projects(:lean).assets.count') do
      post :create, project_id: projects(:lean).id, asset: { name: "test" }
    end

    assert_redirected_to project_asset_path(projects(:lean).id, assigns(:asset))
  end

  test "should show asset" do
    get :show, project_id: projects(:lean).id, id: @asset.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, project_id: projects(:lean).id, id: @asset.id
    assert_response :success
  end

  test "should update asset" do
    patch :update, project_id: projects(:lean).id, id: @asset.id, asset: { name: "Hello" }
    assert_redirected_to project_asset_path(projects(:lean).id, @asset)
  end

  test "should destroy asset" do
    assert_difference('Asset.count', -1) do
      delete :destroy, project_id: projects(:lean).id, id: @asset.id
    end

    assert_redirected_to project_assets_path(projects(:lean).id)
  end
end
