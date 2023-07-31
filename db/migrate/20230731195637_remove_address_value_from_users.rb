class RemoveAddressValueFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :address_value, :text
  end
end
