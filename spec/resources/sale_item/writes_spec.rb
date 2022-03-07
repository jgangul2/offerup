require "rails_helper"

RSpec.describe SaleItemResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "sale_items",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SaleItemResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { SaleItem.count }.by(1)
    end
  end

  describe "updating" do
    let!(:sale_item) { create(:sale_item) }

    let(:payload) do
      {
        data: {
          id: sale_item.id.to_s,
          type: "sale_items",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SaleItemResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { sale_item.reload.updated_at }
      # .and change { sale_item.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:sale_item) { create(:sale_item) }

    let(:instance) do
      SaleItemResource.find(id: sale_item.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { SaleItem.count }.by(-1)
    end
  end
end
