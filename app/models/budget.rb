class Budget < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User', optional: true
  has_many :category_budgets, dependent: :destroy
  has_many :categories, through: :category_budgets, dependent: :destroy
end
