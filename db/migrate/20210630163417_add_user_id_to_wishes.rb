class AddUserIdToWishes < ActiveRecord::Migration[6.1]
  def change
    add_column :wishes, :user_id, :integer
    add_index :wishes, :user_id
  end
end
