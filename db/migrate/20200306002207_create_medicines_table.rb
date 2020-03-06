class CreateMedicinesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |x|
      x.string :rx_name
      x.integer :pill_count
      x.integer :pill_size
      x.integer :user_id
      x.integer :employee_id
    end
  end
end
