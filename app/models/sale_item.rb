class SaleItem < ApplicationRecord
  # Direct associations

  belongs_to :seller,
             :class_name => "User"

  belongs_to :category,
             :foreign_key => "item_category"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sale_price
  end

end
