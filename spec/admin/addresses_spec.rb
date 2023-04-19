require 'rails_helper'

RSpec.describe Admin::AddressesController, type: :controller do
  render_views
  set_admin_user
  before (:each) do
    @address = FactoryBot.create(:address)
  end

  describe 'Address Rspec' do
    it 'redirects to index of Address' do
      get :index
      expect(response.code).to eq('200')
    end
  end
end