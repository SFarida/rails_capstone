require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.new(name: 'John Doe', email: 'john@mail.com', password: 'password') }
  let(:category) do
    Category.create(user_id: user.id, name: 'Drinks', icon: 'https://shorturl.at/dDKSZ')
  end
  let(:transaction1) do
    Purchase.create(user_id: user.id, category_id: category.id, name: 'Fanta', amount: 400.0)
  end

  let(:transaction2) do
    Purchase.create(user_id: user.id, category_id: category.id, name: 'Coca cola', amount: 600.0)
  end

  describe 'attributes' do
    it 'has a name' do
      expect(category.name).to eq('Drinks')
    end

    it 'has the right icon' do
      expect(category.icon).to eq('https://shorturl.at/dDKSZ')
    end
  end
end
