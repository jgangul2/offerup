require 'rails_helper'

RSpec.describe "sale_items#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sale_items", params: params
  end

  describe 'basic fetch' do
    let!(:sale_item1) { create(:sale_item) }
    let!(:sale_item2) { create(:sale_item) }

    it 'works' do
      expect(SaleItemResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['sale_items'])
      expect(d.map(&:id)).to match_array([sale_item1.id, sale_item2.id])
    end
  end
end
