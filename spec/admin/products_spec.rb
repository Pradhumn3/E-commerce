require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  render_views
  set_admin_user
  before (:each) do
    @product = FactoryBot.create(:product)
  end

  describe 'Product Rspec' do
    it 'redirects to index of products' do
      get :index
      expect(response.code).to eq('200')
    end
  end

  describe 'show product' do
    it 'redirects to show of products' do
      get :show, params: {id: @product.id}
      expect(response.code).to eq('200')
    end
  end

  describe 'To create a Product in admin' do
    let(:params) { { name: 'Product1', price: "2000", description: "lorem", quantity: 1}}
    it 'POST /create product' do
      post :create, params: params
      expect(response.code).to eq('200')
    end
  end
end