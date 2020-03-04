class EditAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :status, :string 
    change_column :appointments, :apt_date, :string
  end
end
