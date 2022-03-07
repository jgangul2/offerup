require "rails_helper"

RSpec.describe "sale_items#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sale_items/#{sale_item.id}", payload
  end

  describe "basic update" do
    let!(:sale_item) { create(:sale_item) }

    let(:payload) do
      {
        data: {
          id: sale_item.id.to_s,
          type: "sale_items",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SaleItemResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { sale_item.reload.attributes }
    end
  end
end
