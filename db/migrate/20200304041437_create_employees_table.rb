class CreateEmployeesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |x|
      x.string :name
      x.integer :experience
      x.string :speciality
    end
  end
end
