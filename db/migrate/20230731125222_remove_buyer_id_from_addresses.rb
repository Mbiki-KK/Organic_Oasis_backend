class RemoveBuyerIdFromAddresses < ActiveRecord::Migration[7.0]
  def change
    remove_column :addresses, :buyer_id
  end
end
