class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
    @assets = Asset.all
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
  end

  # GET /assets/new
  def new
    @asset = Asset.new
  end

  # GET /assets/1/edit
  def edit
  end

  
  def create

    @project = Project.find(params[:project_id])
  
    # Double check the group and make sure it belongs to the project 
    # because the field is being passed through a hidden field.
    
    if @project.groups.exists?(asset_params[:group_id])
      @group = @project.groups.find(asset_params[:group_id])
      @asset = @group.assets.create(asset_params)
    end

  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json

  def update
    respond_to do |format|
      @project = Project.find(params[:project_id])
      if @asset.update(asset_params)
        format.js
        #format.html { redirect_to edit_project_path(@project), notice: 'Asset was successfully updated.' }
        #format.json { head :no_content }
      else
        format.js
        #format.html { render action: 'edit' }
        #format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @test = @asset
    @asset.destroy
    
    respond_to do |format|
      format.js
    #  format.html { redirect_to edit_project_path(@project) }
    #  format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:title, :group_id, :image)
    end
end
