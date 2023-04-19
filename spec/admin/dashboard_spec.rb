require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  render_views
  set_admin_user
  before (:each) do
    @user = FactoryBot.create(:user)
    @order = Order.create(user_id: @user.id)
    @category = FactoryBot.create(:category)
    @product = FactoryBot.create(:product)
  end

  describe 'Dashboard Rspec' do
    it 'redirects to index of Dashboard' do
      get :index
      expect(response.code).to eq('200')
    end
  end
end