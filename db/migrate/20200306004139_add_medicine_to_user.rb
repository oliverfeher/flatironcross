class AddMedicineToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :medicine_id, :integer 
  end
end
