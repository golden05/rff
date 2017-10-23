class Corp < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_many :jobs
  has_many :users, through: :jobs

end
