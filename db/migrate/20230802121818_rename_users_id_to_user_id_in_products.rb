class RenameUsersIdToUserIdInProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :users_id, :user_id
  end
end
