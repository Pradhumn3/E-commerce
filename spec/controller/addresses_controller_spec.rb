require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  set_user
  before(:each) do
    @address = create(:address)
  end

  describe "Post #Create" do
    it "returns a success response" do
      params = { address: {house_no: "159", area: "Vijay Nagar", land_mark: "Near XH hospital", city: "Indore" }}
      get :create, params: params
      expect(response.body).to eq("<html><body>You are being <a href=\"http://test.host/addresses\">redirected</a>.</body></html>")
    end
  end

  describe "Put #Update" do
    it "returns a success response" do
      params = { address: { house_no: "160" }}
      patch :update, params: params
      expect(response.body).to eq("<html><body>You are being <a href=\"http://test.host/addresses\">redirected</a>.</body></html>")
    end
  end
end