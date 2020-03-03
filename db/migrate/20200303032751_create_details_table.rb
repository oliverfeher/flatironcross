class CreateDetailsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |x|
      x.string :full_name
      x.string :gender
      x.string :address
      x.string :dob
      x.string :phone_number
      x.integer :user_id
    end
  end
end
