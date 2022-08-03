class ResourceBudgetsController < ApplicationController
  before_action :set_resource_budget, only: %i[ show edit update destroy ]

  # GET /resource_budgets or /resource_budgets.json
  def index
    @resource_budgets = ResourceBudget.all
  end

  # GET /resource_budgets/1 or /resource_budgets/1.json
  def show
  end

  # GET /resource_budgets/new
  def new
    @resource_budget = ResourceBudget.new
  end

  # GET /resource_budgets/1/edit
  def edit
  end

  # POST /resource_budgets or /resource_budgets.json
  def create
    @resource_budget = ResourceBudget.new(resource_budget_params)

    respond_to do |format|
      if @resource_budget.save
        format.html { redirect_to resource_budget_url(@resource_budget), notice: "Resource budget was successfully created." }
        format.json { render :show, status: :created, location: @resource_budget }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_budgets/1 or /resource_budgets/1.json
  def update
    respond_to do |format|
      if @resource_budget.update(resource_budget_params)
        format.html { redirect_to resource_budget_url(@resource_budget), notice: "Resource budget was successfully updated." }
        format.json { render :show, status: :ok, location: @resource_budget }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resource_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_budgets/1 or /resource_budgets/1.json
  def destroy
    @resource_budget.destroy

    respond_to do |format|
      format.html { redirect_to resource_budgets_url, notice: "Resource budget was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_budget
      @resource_budget = ResourceBudget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resource_budget_params
      params.require(:resource_budget).permit(:member_id, :currency_id, :period_start, :period_end, :classification, :base_rate, :weekly_rate, :monthly_rate, :annual_rate, :fiscal_year, :comments)
    end
end
