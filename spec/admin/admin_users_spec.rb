require 'rails_helper'

RSpec.describe Admin::AdminUsersController, type: :controller do
  render_views
  set_admin_user
  before (:each) do
    @admin_user = FactoryBot.create(:admin_user)
  end

  describe 'AdminUser Rspec' do
    it 'redirects to index of AminUser' do
      get :index
      expect(response.code).to eq('200')
    end
  end

  describe 'To create a Admin User in admin' do
    let(:params) { { email: 'surgery@yopmail.com', password: "123456", password_confirmation: "123456"}}
    it 'POST /create Admin User' do
      post :create, params: params
      expect(response.code).to eq('200')
    end
  end
end