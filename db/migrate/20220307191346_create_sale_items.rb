class CreateSaleItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_items do |t|
      t.integer :sale_price
      t.string :item_status
      t.integer :seller_id
      t.integer :buyer_id
      t.string :item_title
      t.string :location
      t.string :photo_link
      t.string :item_description
      t.integer :item_category

      t.timestamps
    end
  end
end
