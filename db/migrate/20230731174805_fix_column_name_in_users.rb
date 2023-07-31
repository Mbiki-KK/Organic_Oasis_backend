class FixColumnNameInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :address, :address_value
  end
end
