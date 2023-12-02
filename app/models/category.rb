class Category < ApplicationRecord
    belongs_to :user
    has_many :transactions, foreign_key: :category_id, dependent: :destroy

    validates :name, :icon, presence: true

    def total_amount
        transactions.sum(:amount)
    end
end
