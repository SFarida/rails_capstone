class Category < ApplicationRecord
  belongs_to :user
  has_many :purchases, foreign_key: :category_id, dependent: :destroy

  validates :name, :icon, presence: true

  def total_amount
    purchases.sum(:amount)
  end
end
