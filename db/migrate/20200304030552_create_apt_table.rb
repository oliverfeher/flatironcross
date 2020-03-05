class CreateAptTable < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |x|
      x.string :symptoms
      x.string :reason
      x.string :apt_date
      x.string :full_name
      x.integer :user_id
      x.integer :employee_id
    end
  end
end
