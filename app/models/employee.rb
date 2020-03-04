class Employee < ActiveRecord::Base
    has_secure_password  # needs to fix e.password to return NIL
    has_many :appointments
    has_many :users, through: :appointments
end