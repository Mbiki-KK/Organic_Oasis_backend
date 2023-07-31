class ChangeReviewsIdNullableInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :reviews_id, true
  end
end
