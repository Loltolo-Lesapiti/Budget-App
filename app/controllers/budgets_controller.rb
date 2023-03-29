class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit update destroy]

  def new
    @budget = Budget.new
    @categories = Category.all
  end

  # GET /budgets/1/edit
  def edit; end

  # POST /budgets or /budgets.json
  def create
    @categories = current_user.categories
    params = budget_params
    @budget = Budget.new(name: params[:name], amount: params[:amount])
    @budget.user = current_user

    if @budget.save
      @category = Category.find(params[:category_id])
      @category.budgets << @budget
      redirect_to category_path(params[:category_id]), notice: 'Budget was successfully created.'
    else
      flash[:danger] = 'Budget was not created.'
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /budgets/1 or /budgets/1.json
  def destroy
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_budget
    @budget = Budget.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def budget_params
    params.permit(:name, :amount, :category_id)
  end
end
