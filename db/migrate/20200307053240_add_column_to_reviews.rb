class AddColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :rating, :string
  end
end
