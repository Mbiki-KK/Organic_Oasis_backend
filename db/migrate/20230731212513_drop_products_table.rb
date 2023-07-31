class DropProductsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :products
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
