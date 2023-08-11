class RenameImageColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :image, :image_data
  end
end
