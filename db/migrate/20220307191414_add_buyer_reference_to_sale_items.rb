class AddBuyerReferenceToSaleItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :sale_items, :users, column: :buyer_id
    add_index :sale_items, :buyer_id
    change_column_null :sale_items, :buyer_id, false
  end
end
