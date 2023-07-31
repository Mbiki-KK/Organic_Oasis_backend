class DropTableName < ActiveRecord::Migration[7.0]
  def up
    drop_table :Addresses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
