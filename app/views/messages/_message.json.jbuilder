json.extract! message, :id, :sender_user_id, :recipient_user_id, :created_at,
              :updated_at
json.url message_url(message, format: :json)
