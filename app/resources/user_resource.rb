class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :screen_name, :string

  # Direct associations

  has_many   :items_purchased,
             resource: SaleItemResource,
             foreign_key: :buyer_id

  has_many   :items_for_sale,
             resource: SaleItemResource,
             foreign_key: :seller_id

  has_many   :recieved_messages,
             resource: MessageResource,
             foreign_key: :recipient_user_id

  has_many   :sent_messages,
             resource: MessageResource,
             foreign_key: :sender_user_id

  # Indirect associations

end
