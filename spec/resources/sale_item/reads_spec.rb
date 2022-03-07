require "rails_helper"

RSpec.describe SaleItemResource, type: :resource do
  describe "serialization" do
    let!(:sale_item) { create(:sale_item) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sale_item.id)
      expect(data.jsonapi_type).to eq("sale_items")
    end
  end

  describe "filtering" do
    let!(:sale_item1) { create(:sale_item) }
    let!(:sale_item2) { create(:sale_item) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: sale_item2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([sale_item2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:sale_item1) { create(:sale_item) }
      let!(:sale_item2) { create(:sale_item) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      sale_item1.id,
                                      sale_item2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      sale_item2.id,
                                      sale_item1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
