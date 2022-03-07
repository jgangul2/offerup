json.extract! sale_item, :id, :sale_price, :item_status, :seller_id, :buyer_id, :item_title, :location, :photo_link, :item_description, :item_category, :created_at, :updated_at
json.url sale_item_url(sale_item, format: :json)
