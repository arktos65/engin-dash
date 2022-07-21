class JiraIssuesController < ApplicationController
  before_action :set_jira_issue, only: %i[ show edit update destroy ]

  # GET /jira_issues or /jira_issues.json
  def index
    @jira_issues = JiraIssue.all
  end

  # GET /jira_issues/1 or /jira_issues/1.json
  def show
  end

  # GET /jira_issues/new
  def new
    @jira_issue = JiraIssue.new
  end

  # GET /jira_issues/1/edit
  def edit
  end

  # POST /jira_issues or /jira_issues.json
  def create
    @jira_issue = JiraIssue.new(jira_issue_params)

    respond_to do |format|
      if @jira_issue.save
        format.html { redirect_to jira_issue_url(@jira_issue), notice: "Jira issue was successfully created." }
        format.json { render :show, status: :created, location: @jira_issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jira_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jira_issues/1 or /jira_issues/1.json
  def update
    respond_to do |format|
      if @jira_issue.update(jira_issue_params)
        format.html { redirect_to jira_issue_url(@jira_issue), notice: "Jira issue was successfully updated." }
        format.json { render :show, status: :ok, location: @jira_issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jira_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jira_issues/1 or /jira_issues/1.json
  def destroy
    @jira_issue.destroy

    respond_to do |format|
      format.html { redirect_to jira_issues_url, notice: "Jira issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jira_issue
      @jira_issue = JiraIssue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jira_issue_params
      params.require(:jira_issue).permit(:jira_issue_id, :jira_project_id, :issue_key, :issue_url, :issue_title, :issue_status, :issue_type, :story_points, :issue_created, :issue_updated)
    end
end
