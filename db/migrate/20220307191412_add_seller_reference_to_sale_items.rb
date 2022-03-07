class AddSellerReferenceToSaleItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :sale_items, :users, column: :seller_id
    add_index :sale_items, :seller_id
    change_column_null :sale_items, :seller_id, false
  end
end
