class CreateBeverages < ActiveRecord::Migration[7.0]
  def change
    create_table :beverages do |t|
      t.string :name
      t.decimal :price
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
