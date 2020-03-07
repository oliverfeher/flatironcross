class CreateReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |x|
      x.string :title
      x.string :content
      x.date :date
      x.integer :user_id
    end
  end
end
