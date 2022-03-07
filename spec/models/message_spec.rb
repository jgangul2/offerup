require "rails_helper"

RSpec.describe Message, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:recipient_user) }

    it { should belong_to(:sender_user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
