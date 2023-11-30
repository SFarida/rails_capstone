class Transaction < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'user_id'
    has_many :categories

    validates :name, :amount, presence: true
end
