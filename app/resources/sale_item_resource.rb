class SaleItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sale_price, :integer
  attribute :item_status, :string
  attribute :seller_id, :integer
  attribute :buyer_id, :integer
  attribute :item_title, :string
  attribute :location, :string
  attribute :photo_link, :string
  attribute :item_description, :string
  attribute :item_category, :integer

  # Direct associations

  belongs_to :buyer,
             resource: UserResource

  belongs_to :seller,
             resource: UserResource

  belongs_to :category,
             foreign_key: :item_category

  # Indirect associations
end
