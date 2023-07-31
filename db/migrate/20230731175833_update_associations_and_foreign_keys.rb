class UpdateAssociationsAndForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :address_id
    add_reference :users, :address, foreign_key: true, null: false

  end
end
