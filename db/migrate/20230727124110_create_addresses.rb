class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :recipient_name
      t.string :street_address
      t.string :city
      t.references :buyer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
