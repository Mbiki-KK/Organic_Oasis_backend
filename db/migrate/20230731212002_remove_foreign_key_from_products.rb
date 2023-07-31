class RemoveForeignKeyFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :products, :sellers

  end
end
