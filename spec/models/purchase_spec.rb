require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:user) { User.new(name: 'John Doe', email: 'john@mail.com', password: 'password') }
  let(:category) do
    Category.create(user_id: user.id, name: 'Drinks', icon: 'https://shorturl.at/dDKSZ')
  end
  let(:purchase) do
    Purchase.create(user_id: user.id, category_id: category.id, name: 'Fanta', amount: 400.0)
  end

  describe 'has attributes' do
    it 'has a name' do
      expect(purchase.name).to eq('Fanta')
    end

    it 'has the right amount' do
      expect(purchase.amount).to eq(400.0)
    end
  end
end
