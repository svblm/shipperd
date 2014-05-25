class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def index
    @assets = Asset.all
  end

  def show
  end

  def new
    @asset = Asset.new
  end

  def edit
  end

  def create
    @asset = Asset.new(asset_params)
    @asset.project = @project
    if @asset.save
      redirect_to project_asset_path(@project, @asset), notice: 'Asset was successfully created.'
    else
      render :new
    end
  end

  def update
    if @asset.update(asset_params)
      redirect_to project_asset_path(@project, @asset), notice: 'Asset was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @asset.destroy
    redirect_to assets_url, notice: 'Asset was successfully destroyed.'
  end

  private
    def set_asset
      @asset = Asset.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def asset_params
      params.require(:asset).permit(:name)
    end
end
