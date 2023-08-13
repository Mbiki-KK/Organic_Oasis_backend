class AddPasswordDigestToSellers < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :password_digest, :string
  end
end
