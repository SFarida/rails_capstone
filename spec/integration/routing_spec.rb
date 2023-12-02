require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to home#index' do
      expect(get: '/').to route_to('home#index')
    end

    it 'routes to devise/sessions#new' do
      expect(get: 'users/sign_in').to route_to('devise/sessions#new')
    end

    it 'routes to devise/registrations#new' do
      expect(get: 'users/sign_up').to route_to('devise/registrations#new')
    end

    it 'routes to devise/passwords#new' do
      expect(get: '/users/password/new').to route_to('devise/passwords#new')
    end

    it 'routes to #index' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'routes to #new' do
      expect(get: '/categories/new_category').to route_to('categories#new')
    end

    it 'routes to #show' do
      expect(get: '/categories/1').to route_to('categories#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/categories/1/edit').to route_to('categories#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/categories').to route_to('categories#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/categories/1').to route_to('categories#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/categories/1').to route_to('categories#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/categories/1').to route_to('categories#destroy', id: '1')
    end
  end
end
