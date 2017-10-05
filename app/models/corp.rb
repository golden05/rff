class Corp < ApplicationRecord

  validates :name, presence: true, uniqueness: true
end
