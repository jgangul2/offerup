class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_user_id, :integer
  attribute :recipient_user_id, :integer

  # Direct associations

  belongs_to :sender_user,
             resource: UserResource

  # Indirect associations

end
