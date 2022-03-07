require "rails_helper"

RSpec.describe "sale_items#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sale_items/#{sale_item.id}"
  end

  describe "basic destroy" do
    let!(:sale_item) { create(:sale_item) }

    it "updates the resource" do
      expect(SaleItemResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { SaleItem.count }.by(-1)
      expect { sale_item.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
