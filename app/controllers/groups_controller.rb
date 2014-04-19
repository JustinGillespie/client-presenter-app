class GroupsController < ApplicationController
  before_action :set_project, only: [:create, :update, :destroy]
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json

  def create
    @group = @project.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to edit_project_path(@project), notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { redirect_to edit_project_path(@project) }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update  
    #respond_to do |format|
    #  if @group.update(group_params)
    #    format.json { head :no_content }
    #  else
    #    format.json { render json: @group.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to edit_project_path(@project), notice: 'Group Removed'}
      format.json { head :no_content }
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_group
      @group = @project.groups.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:title, :project_id)
    end
end
