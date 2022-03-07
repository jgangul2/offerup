class AddCategoryReferenceToSaleItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :sale_items, :categories, column: :item_category
    add_index :sale_items, :item_category
    change_column_null :sale_items, :item_category, false
  end
end
