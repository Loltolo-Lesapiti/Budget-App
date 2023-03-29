class AddCategoryIdToCategoryBudgets < ActiveRecord::Migration[7.0]
  def change
    add_column :category_budgets, :category_id, :integer
  end
end
