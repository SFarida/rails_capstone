require 'rails_helper'

RSpec.describe 'Manage Category', type: :system do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'john@mail.com', password: 'password',
                        password_confirmation: 'password')
    @category = Category.new(user_id: @user.id, name: 'Drinks', icon: 'https://shorturl.at/dDKSZ')
  end

  it 'User should be able to create a new Category' do
    visit root_path
    click_link('Login')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button('Log in')
  end
  it 'User should be able to see details for any category' do
    visit root_path
    click_link('Register')
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password
    click_button('Sign up')
  end
end
