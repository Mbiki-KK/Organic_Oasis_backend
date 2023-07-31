class AddUserIdToAddresses < ActiveRecord::Migration[7.0]
  def change
     # Remove the foreign key constraint
     remove_foreign_key :addresses, :buyers

     # Remove the buyer_id column
     remove_column :addresses, :buyer_id
    add_reference :addresses, :user, null: false, foreign_key: true
  end
end
