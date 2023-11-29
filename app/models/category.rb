class Category < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :transactions, foreign_key: :category_id, dependent: :destroy

    validates :name, :icon presence: true
end
