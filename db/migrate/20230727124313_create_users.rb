class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :contacts
      t.string :address
      t.string :type
      t.references :reviews, null: false, foreign_key: true

      t.timestamps
    end
  end
end
