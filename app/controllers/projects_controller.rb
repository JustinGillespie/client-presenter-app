class ProjectsController < ApplicationController

  before_action :set_client
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  
  #before_filter :authorize_client
  before_filter :authorize

  def index
    @projects = @client.projects.all
  end

  def show
    @groups = @project.groups.all
  end

  def new
    @project = Project.new
  end

  def edit
    @groups = @project.groups.all
    @group = @project.groups.new
  end
  
  def create
    @project = @client.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to client_project_path(@client, @project), notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.js
        format.html { redirect_to edit_project_path(@project), notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

private
  
  # Use callbacks to share common setup or constraints between actions.

  def set_client
    @client = Client.find(current_user.client_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  
  def project_params
    params.require(:project).permit(:name, :client_id)
  end

end
