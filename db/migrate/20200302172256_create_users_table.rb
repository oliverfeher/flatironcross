class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |x|
      x.string :email
      x.string :password_digest
    end
  end
end
