require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:items_purchased) }

    it { should have_many(:items_for_sale) }

    it { should have_many(:recieved_messages) }

    it { should have_many(:sent_messages) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
