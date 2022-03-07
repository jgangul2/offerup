class Category < ApplicationRecord
  # Direct associations

  has_many   :items_in_category,
             class_name: "SaleItem",
             foreign_key: "item_category",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
