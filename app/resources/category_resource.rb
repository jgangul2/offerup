class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_name, :string

  # Direct associations

  has_many   :items_in_category,
             resource: SaleItemResource,
             foreign_key: :item_category

  # Indirect associations
end
