class ChangeImageDataTypeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :image_data, :text
  end
end
