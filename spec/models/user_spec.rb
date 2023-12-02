require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'John Doe', email: 'john@mail.com', password: 'password') }
  let(:category) do
    Category.create(user_id: user.id, name: 'Drinks', icon: 'https://shorturl.at/dDKSZ')
  end
  let(:transaction1) do
    Transaction.create(user_id: user.id, category_id: category.id, name: 'Fanta', amount: 400.0)
  end

  let(:transaction2) do
    Transaction.create(user_id: user.id, category_id: category.id, name: 'Coca cola', amount: 600.0)
  end

  describe 'has name' do
    it 'has a name' do
      expect(user.name).to eq('John Doe')
    end

    it 'has an email' do
      expect(user.email).to eq('john@mail.com')
    end
  end
end
