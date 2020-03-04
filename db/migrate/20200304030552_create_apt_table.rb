class CreateAptTable < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |x|
      x.string :symptoms
      x.string :diagnosis
      x.datetime :apt_date
      x.boolean :follow_up?
      x.integer :user_id
      x.integer :employee_id
    end
  end
end
