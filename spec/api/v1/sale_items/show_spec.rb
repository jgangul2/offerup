require "rails_helper"

RSpec.describe "sale_items#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sale_items/#{sale_item.id}", params: params
  end

  describe "basic fetch" do
    let!(:sale_item) { create(:sale_item) }

    it "works" do
      expect(SaleItemResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("sale_items")
      expect(d.id).to eq(sale_item.id)
    end
  end
end
