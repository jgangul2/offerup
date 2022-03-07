class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :items_purchased,
             :class_name => "SaleItem",
             :foreign_key => "buyer_id",
             :dependent => :destroy

  has_many   :items_for_sale,
             :class_name => "SaleItem",
             :foreign_key => "seller_id",
             :dependent => :destroy

  has_many   :recieved_messages,
             :class_name => "Message",
             :foreign_key => "recipient_user_id",
             :dependent => :destroy

  has_many   :sent_messages,
             :class_name => "Message",
             :foreign_key => "sender_user_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
