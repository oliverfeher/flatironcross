class Employee < ActiveRecord::Base
    has_many :appointments
    has_many :users, through: :appointments
end