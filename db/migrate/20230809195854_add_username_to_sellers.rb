class AddUsernameToSellers < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :username, :string
  end
end
