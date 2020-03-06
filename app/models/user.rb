class User < ActiveRecord::Base
    has_secure_password
    has_one :detail
    has_many :appointments
    has_many :employees, through: :appointments
    has_many :medicines
    has_many :employees, through: :medicines
end