class AddRecipientUserReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :recipient_user_id
    add_index :messages, :recipient_user_id
    change_column_null :messages, :recipient_user_id, false
  end
end
