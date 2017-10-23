class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true

  has_many :jobs 
  has_many :corps, through: :jobs
end
