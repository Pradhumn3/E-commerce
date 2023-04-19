require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  render_views
  set_admin_user
  before (:each) do
    @user = FactoryBot.create(:user)
  end

  describe 'User Rspec' do
    it 'redirects to index of User' do
      get :index
      expect(response.code).to eq('200')
    end
  end
end