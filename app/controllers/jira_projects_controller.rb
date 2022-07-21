class JiraProjectsController < ApplicationController
  before_action :set_jira_project, only: %i[ show edit update destroy ]

  # GET /jira_projects or /jira_projects.json
  def index
    @jira_projects = JiraProject.all
  end

  # GET /jira_projects/1 or /jira_projects/1.json
  def show
  end

  # GET /jira_projects/new
  def new
    @jira_project = JiraProject.new
  end

  # GET /jira_projects/1/edit
  def edit
  end

  # POST /jira_projects or /jira_projects.json
  def create
    @jira_project = JiraProject.new(jira_project_params)

    respond_to do |format|
      if @jira_project.save
        format.html { redirect_to jira_project_url(@jira_project), notice: "Jira project was successfully created." }
        format.json { render :show, status: :created, location: @jira_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jira_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jira_projects/1 or /jira_projects/1.json
  def update
    respond_to do |format|
      if @jira_project.update(jira_project_params)
        format.html { redirect_to jira_project_url(@jira_project), notice: "Jira project was successfully updated." }
        format.json { render :show, status: :ok, location: @jira_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jira_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jira_projects/1 or /jira_projects/1.json
  def destroy
    @jira_project.destroy

    respond_to do |format|
      format.html { redirect_to jira_projects_url, notice: "Jira project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jira_project
      @jira_project = JiraProject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jira_project_params
      params.require(:jira_project).permit(:project_id, :jira_project_id, :name, :jira_key, :total_issue_count, :last_issue_update, :self_url)
    end
end
